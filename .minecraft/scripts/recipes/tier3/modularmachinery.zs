#reloadable
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.MachineStructureFormedEvent;
import mods.modularmachinery.RecipeEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.Sync;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IVector3d;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.util.Math;
import mods.zenutils.StringList;
import mods.zenutils.DataUpdateOperation;
import scripts.libs.Util.basicAspects;
import native.thaumcraft.common.entities.EntityFluxRift;
import native.kport.modularmagic.common.tile.TileAspectProvider;

RecipeBuilder.newBuilder("perditio_crystal", "emptiness_energizer", 120)
    // .addImpetusInput(20)
    .addItemInputs(<contenttweaker:warp_crystal>, <thaumcraft:ingot:1> * 4, <thaumicaugmentation:material:5> * 2, <thaumadditions:mithminite_nugget>)
    .addImpetusInput(200)
    .addItemOutput(<contenttweaker:perditio_crystal>)
    .addStartHandler(function(event as RecipeStartEvent) {
        val order = intArrayOf(6);
        val stringList = StringList.create([0, 1, 2, 3, 4, 5]);
        stringList.shuffle();
        for index, id in stringList {
            order[index] = id;
        }
        event.controller.customData = {"Order": order};
    })
    .addPreTickHandler(function(event as RecipeTickEvent) {
        val controller = event.controller;
        val pos = controller.pos;
        val world = controller.world;
        if (event.activeRecipe.tick % 10 == 1) {
            val posA as IBlockPos = controller.relativePos(-5, 0, 0);
            val posB as IBlockPos = controller.relativePos(5, 10, 10);
            var success as bool = false;
            for entity in world.getEntitiesInArea(posA, posB) {
                if (entity.native instanceof EntityFluxRift) {
                    val rift = entity.native as EntityFluxRift;
                    if (rift.riftSize >= 100) {
                        success = true;
                        break;
                    }
                }
            }
            if (!success) {
                event.preventProgressing("no 100 size rift");
                return;
            }
        }
        if (event.activeRecipe.tick % 20 == 1) {
            val requireAspectId as int = controller.customData.Order[event.activeRecipe.tick / 20].asInt();
            val requireAspectName as string = basicAspects[requireAspectId];
            val aspectInputBus = world.native.getTileEntity(controller.relativePos(0, 0, 10)) as TileAspectProvider;
            if (aspectInputBus.aspect == null) {
                event.preventProgressing("Requires aspect: " ~ requireAspectName);
                world.setBlockState(<blockstate:extrautils2:redstonelantern>.withProperty("power", requireAspectId + 1), pos.up(8));
            } else if (aspectInputBus.aspect.tag != requireAspectName) {
                event.setFailed(true, "wrong aspect input type");
            } else if (aspectInputBus.amount < 40) {
                event.preventProgressing("not enough aspect input");
            } else {
                aspectInputBus.takeFromContainer(aspectInputBus.aspect, aspectInputBus.amount);
                world.setBlockState(<blockstate:extrautils2:redstonelantern>, pos.up(8));
            }
        }
    })
    .addFinishHandler(function(event as RecipeFinishEvent) {
        val controller = event.controller;
        val world = controller.world;
        val pos = controller.pos;
        val posA as IBlockPos = controller.relativePos(-5, 0, 0);
        val posB as IBlockPos = controller.relativePos(5, 10, 10);
        for entity in world.getEntitiesInArea(posA, posB) {
            if (entity.native instanceof EntityFluxRift) {
                world.performExplosion(null, entity.x, entity.y, entity.z, 1.5f, false, false);
                entity.setDead();
            }
        }
        world.setBlockState(<blockstate:extrautils2:redstonelantern>, controller.pos.up(8));
    })
    .build();

MMEvents.onStructureFormed("emptiness_energizer", function(event as MachineStructureFormedEvent) {
    val controller = event.controller;
    val world = controller.world;
    world.setCustomWorldData(world.getCustomWorldData().deepUpdate({
        EmptinessEnergizer: [
            controller.pos.asData()
        ]
    }, DataUpdateOperation.MERGE));
});

function checkCircuit(controller as IMachineController, high as bool, required as int) as bool {
    val offset as int = high ? -2 : 2;
    val itemHandler = controller.world.getItemHandler(controller.relativePos(offset, 0, 2), up);
    val item = itemHandler.getStackInSlot(0);
    val lampOffset = controller.relativePos(offset, 0, 0);
    if (<calculator:circuitboard:*>.withTag({Stable: 1 as byte, Analysed: 1 as byte}).matches(item)) {
        if (item.metadata == required) {
            controller.world.setBlockState(<blockstate:diamondlamps:greenlamp>, lampOffset);
            return true;
        } else if (item.metadata > required) {
            controller.world.setBlockState(<blockstate:diamondlamps:redlamp>, lampOffset);
            return false;
        } else {
            controller.world.setBlockState(<blockstate:diamondlamps:purplelamp>, lampOffset);
            return false;
        }
    }
    controller.world.setBlockState(<blockstate:diamondlamps:blacklamp>, lampOffset);
    return false;
}

RecipeBuilder.newBuilder("calculation_crystal", "digital_calculator", 120)
    .addItemInputs(<contenttweaker:logic_crystal>, <appliedenergistics2:material:37>, <calculator:flawlessassembly>, <contenttweaker:network_module>)
    .addItemOutput(<contenttweaker:calculation_crystal>)
    .addEnergyPerTickInput(2400)
    .addStartHandler(function(event as RecipeStartEvent) {
        event.controller.customData = {"Password": event.controller.world.random.nextInt(196)};
    })
    .addPreTickHandler(function(event as RecipeTickEvent) {
        if (event.activeRecipe.tick != 20) return;
        val controller = event.controller;
        val world = controller.world;
        val password as int = controller.customData.Password.asInt();
        if (checkCircuit(controller, true, password / 14) & checkCircuit(controller, false, password % 14)) {
            for x in ([-2, 2] as int[]) {
                world.getItemHandler(controller.relativePos(x, 0, 2), up).extractItem(0, 1, false);
            }
        } else {
            event.preventProgressing("Invalid password");
        }
    })
    .addFinishHandler(function(event as RecipeFinishEvent) {
        val controller = event.controller;
        for x in ([-2, 2] as int[]) {
            controller.world.setBlockState(<blockstate:diamondlamps:gemlamp>, controller.relativePos(x, 0, 0));
        }
    })
    .build();

MMEvents.onMachinePreTick("natural_grace", function(event as MachineTickEvent) {
    val controller = event.controller;
    val world = controller.world;
    val pos = controller.pos;
    var stormBurstCount as int = 0;
    for entity in world.nearbyEntities(IVector3d.create(0.5 + pos.x, 0.5 + pos.y, 0.5 + pos.z), 2.0).entities {
        val def = entity.definition;
        if (isNull(def)) {
            continue;
        }
        if (def.id == "botania:mana_burst" && entity.tags has "storm") {
            entity.setDead();
            stormBurstCount += 1;
        } else if (def.id == "botania:mana_storm") {
            entity.setDead();
            world.performExplosion(null, entity.x, entity.y, entity.z, 1.5f, false, false);
        }
    }
    if (isNull(controller.customData.Bursts)) {
        controller.customData = {Bursts: 0};
    }
    val prev = controller.customData.Bursts.asInt();
    controller.customData = {Bursts : (prev + stormBurstCount)};
});

RecipeBuilder.newBuilder("nature_crystal", "natural_grace", 120)
    .addItemInputs(
        <contenttweaker:aura_crystal>,
        <botania:manaresource:4>,
        <naturesaura:token_euphoria>,
        <naturesaura:token_terror>,
        <naturesaura:token_rage>,
        <naturesaura:token_grief>,
        <botania:rune:4>,
        <botania:rune:5>,
        <botania:rune:6>,
        <botania:rune:7>
    )
    .addFluidInput(<liquid:cloud_seed_concentrated> * 2000)
    .addAuraInput(800)
    .addItemOutput(<contenttweaker:nature_crystal>)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        val bursts = event.controller.customData.Bursts.asInt();
        if (bursts < 100) {
            event.setFailed("Not enough mana storm bursts");
        }
    })
    .addStartHandler(function(event as RecipeStartEvent) {
        val bursts = event.controller.customData.Bursts.asInt();
        event.controller.customData = {Bursts: bursts - 100};
    })
    .build();

RecipeBuilder.newBuilder("life_crystal", "life_constructor", 120)
    .addItemInputs(
        <contenttweaker:blood_crystal>,
        <bloodmagic:slate:4>,
        <bloodmagic:item_demon_crystal:1> * 2,
        <bloodmagic:item_demon_crystal:2> * 2,
        <bloodmagic:item_demon_crystal:3> * 2,
        <bloodmagic:item_demon_crystal:4> * 2,
        <emergingtechnology:syntheticpigraw> * 3,
        <emergingtechnology:syntheticchickenraw> * 3,
        <emergingtechnology:syntheticcowraw> * 3,
        <emergingtechnology:syntheticleather> * 3,
        <minecraft:rotten_flesh> * 3,
        <thaumcraft:brain> * 3,
        <calculator:firediamond> * 4,
        <contenttweaker:crystal_alga> * 8,
        <calculator:fiddledewfruit> * 8,
        <calculator:broccoli> * 8
    )
    .addItemOutput(<contenttweaker:life_crystal>)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        if (event.controller.world.dimension != -1) {
            event.setFailed("Only works on nether");
        }
    })
    .build();

val timeSpaceCrystalInputs as IIngredient[] = [
    <contenttweaker:astral_crystal>,
    <appliedenergistics2:material:48> * 2,
    <contenttweaker:space_matrix>,
    <enderio:item_material:35>
];

val otherCombinations as int[][] = [
    [0, 1, 2],
    [0, 1, 3],
    [0, 2, 3],
    [1, 2, 3],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 2],
    [1, 3],
    [2, 3],
    [0],
    [1],
    [2],
    [3]
];

RecipeBuilder.newBuilder("space_time_crystal", "time_transmutator", 120, 0)
    .addItemInputs(timeSpaceCrystalInputs)
    .addItemOutput(<contenttweaker:space_time_crystal>)
    .build();

for i, combination in otherCombinations {
    val builder = RecipeBuilder.newBuilder("space_time_crystal_failed_" ~ i, "time_transmutator", 10, 10 - combination.length);
    for j in combination {
        builder.addItemInput(timeSpaceCrystalInputs[j]);
    }
    builder.addItemOutput(<appliedenergistics2:material:46>);
    builder.build();
}

RecipeBuilder.newBuilder("energy_crystal", "energy_field_emitter", 120)
    .addEnergyPerTickInput(512000)
    .addItemInputs(
        <contenttweaker:electric_crystal>,
        <soot:ingot_antimony>,
        <contenttweaker:superconductor>,
        <mekanism:basicblock2:3>.withTag({tier: 1}),
        <soot:mundane_stone>,
        <calculator:electricdiamond>
    )
    .addItemOutput(<contenttweaker:energy_crystal>)
    .addEmberInput(1200)
    .build();

RecipeBuilder.newBuilder("mine_crystal", "mine_catalyst", 120)
    .addItemInputs(
        <contenttweaker:metal_crystal>,
        <mekanism:scrap> * 12,
        <enderio:item_material:75> * 12,
        <calculator:purifiedobsidian> * 4,
        <extrautils2:compressedcobblestone:2>,
        <extrautils2:compressednetherrack:2>,
        <nuclearcraft:gem>* 4,
        <nuclearcraft:gem:1>* 4,
        <nuclearcraft:gem:2>* 4,
        <nuclearcraft:gem:3> * 4,
        <nuclearcraft:gem:4> * 4,
        <nuclearcraft:gem:5> * 4
    )
    .addFluidInput(<liquid:mithril> * 576)
    .addItemOutput(<contenttweaker:mine_crystal>)
    .addPreTickHandler(function(event as RecipeTickEvent) {
        val controller = event.controller;
        val world = controller.world;
        val liquidHandler = world.getLiquidHandler(controller.relativePos(0, 4, 0));
        val content = liquidHandler.tankProperties[0].contents;
        if (content.definition.name == "mine_medium" && Math.abs(content.amount - 128000) <= 500) {
            return;
        }
        event.preventProgressing("mine medium out of 128000±500");
    })
    .build();

MMEvents.onMachinePreTick("mine_catalyst", function(event as MachineTickEvent) {
    val controller = event.controller;
    val world = controller.world;
    if (event.controller.world.worldInfo.worldTotalTime % 10 == 7) {
        val liquidHandler = world.getLiquidHandler(controller.relativePos(0, 4, 0));
        Sync.addSyncTask(function() {
            val content = liquidHandler.tankProperties[0].contents;
            if (!isNull(content) && content.definition.name != "mine_medium") {
                return;
            }
            val fluidAmount = isNull(content) ? 0 : content.amount;
            val minValue = max(-1500, -fluidAmount);
            val maxValue = min(1500, 128000 - fluidAmount);
            val amount = world.random.nextInt(minValue, maxValue);
            if (amount > 0) {
                liquidHandler.fill(<liquid:mine_medium>.withAmount(amount), true);
            } else if (amount < 0) {
                liquidHandler.drain(-amount, true);
            }
        });
    }
});

RecipeBuilder.newBuilder("flux_release_perditio", "flux_releaser", 10)
    .addAspcetInput(10, "perditio")
    .addEnergyPerTickInput(200)
    .addAuraInput(100)
    .addFinishHandler(function(event as RecipeFinishEvent) {
        val controller = event.controller;
        val world = controller.world;
        val pos = controller.pos;
        world.addFlux(pos, 10);
    })
    .addRecipeTooltip(game.localize("modpack.tooltip.flux_releaser.perditio"))
    .build();

RecipeBuilder.newBuilder("flux_release_vitium", "flux_releaser", 10)
    .addAspcetInput(10, "vitium")
    .addEnergyPerTickInput(500)
    .addAuraInput(500)
    .addFinishHandler(function(event as RecipeFinishEvent) {
        val controller = event.controller;
        val world = controller.world;
        val pos = controller.pos;
        world.addFlux(pos, 40);
    })
    .addRecipeTooltip(game.localize("modpack.tooltip.flux_releaser.vitium"))
    .build();

scripts.recipes.tier2.modualrmachinery.newEssentiaGeneratorRecipe(<contenttweaker:space_time_crystal>, "tempus");
