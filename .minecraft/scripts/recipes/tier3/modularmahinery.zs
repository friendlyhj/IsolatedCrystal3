#reloadable

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeEvent;
import mods.modularmachinery.IMachineController;
import crafttweaker.world.IBlockPos;
import crafttweaker.data.IData;
import mods.zenutils.StringList;
import scripts.libs.Util.basicAspects;
import native.thaumcraft.common.entities.EntityFluxRift;
import native.kport.modularmagic.common.tile.TileAspectProvider;

RecipeBuilder.newBuilder("perditio_crystal", "emptiness_energizer", 120)
    // .addImpetusInput(20)
    .addItemInputs(<contenttweaker:warp_crystal>, <thaumcraft:ingot:1> * 4, <thaumicaugmentation:material:5> * 2, <thaumadditions:mithminite_nugget>)
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

function checkCircuit(controller as IMachineController, high as bool, required as int) as bool {
    var offset as int = 2;
    if (high) {
        offset = -2;
    }
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
    .addItemInputs(<contenttweaker:logic_crystal>, <appliedenergistics2:material:38>, <calculator:flawlessassembly>, <contenttweaker:advanced_network_module>)
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