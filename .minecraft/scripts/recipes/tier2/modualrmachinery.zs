#reloadable

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.RecipeEvent;
import mods.modularmachinery.Sync;
import crafttweaker.util.Math;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;

function newEssentiaGeneratorRecipe(item as IItemStack, aspect as string) as void {
    RecipeBuilder.newBuilder(aspect, "essentia_generator", 100)
        .addAspectOutput(aspect, 48)
        .addItemInput(item)
        .addManaInput(8000, false)
        .build();
}

newEssentiaGeneratorRecipe(<contenttweaker:flesh_crystal>, "victus");
newEssentiaGeneratorRecipe(<contenttweaker:heated_crystal>, "ignis");
newEssentiaGeneratorRecipe(<contenttweaker:earth_crystal>, "terra");
newEssentiaGeneratorRecipe(<contenttweaker:vibrant_crystal>, "herba");
newEssentiaGeneratorRecipe(<contenttweaker:crafting_crystal>, "fabrico");
newEssentiaGeneratorRecipe(<contenttweaker:ocean_crystal>, "aqua");
newEssentiaGeneratorRecipe(<contenttweaker:destruction_crystal>, "vacuos");

static organic as IItemStack[] = [
    <minecraft:wheat>,
    <minecraft:pumpkin>,
    <minecraft:melon>,
    <minecraft:beetroot>,
    <minecraft:potato>,
    <minecraft:poisonous_potato>,
    <minecraft:carrot>,
    <minecraft:apple>,
    <minecraft:wheat_seeds>,
    <minecraft:pumpkin_seeds>,
    <minecraft:melon_seeds>,
    <minecraft:pumpkin_seeds>,
    <minecraft:beetroot_seeds>,
    <minecraft:fish:*>,
    <minecraft:leaves:*>,
    <minecraft:sapling:*>,
    <minecraft:deadbush>,
    <minecraft:reeds>,
    <minecraft:cactus>,
    <minecraft:yellow_flower>,
    <minecraft:red_flower:*>,
    <minecraft:double_plant:*>,
    <minecraft:egg>,
    <minecraft:feather>,
    <minecraft:beef>,
    <minecraft:chicken>,
    <minecraft:porkchop>,
    <minecraft:rabbit>,
    <minecraft:mutton>,
    <minecraft:rotten_flesh>,
    <minecraft:brown_mushroom>,
    <minecraft:red_mushroom>,
    <minecraft:nether_wart>,
    <minecraft:dye:3>,
    <minecraft:tallgrass:1>,
    <minecraft:tallgrass:2>,
    <actuallyadditions:item_rice_seed>,
    <actuallyadditions:item_canola_seed>,
    <actuallyadditions:item_flax_seed>,
    <actuallyadditions:item_coffee_seed>,
    <actuallyadditions:item_coffee_beans>,
    <actuallyadditions:item_food:16>,
    <actuallyadditions:item_worm>,
    <actuallyadditions:item_misc:15>,
    <actuallyadditions:item_hairy_ball>,
    <botania:petal:*>,
    <calculator:fiddledewfruit>,
    <calculator:broccoli>,
    <calculator:pear>,
    <calculator:rottenpear>,
    <naturesaura:gold_leaf>,
    <naturesaura:end_flower>,
    <naturesaura:ancient_sapling>,
    <contenttweaker:blood_clot>,
    <contenttweaker:jade_leaf>,
    <immersiveengineering:seed>,
    <immersiveengineering:material:4>,
    <thaumcraft:brain>,
    <thaumcraft:sapling_greatwood>,
    <thaumcraft:sapling_silverwood>,
    <extrautils2:ironwood_sapling>,
    <extrautils2:ironwood_sapling:1>,
];

for item in organic {
    <ore:organicMatter>.add(item);
}

val input = <ore:organicMatter>;

RecipeBuilder.newBuilder("oil", "oil_fabricator", 400)
    .addItemInput(input)
    .addFluidOutput(<liquid:oil> * 80)
    .addAspectInput("terra", 1)
    .addStartHandler(function(event as RecipeStartEvent) {
        val controller = event.controller;
        val inputBus = controller.world.getItemHandler(controller.relativePos(2, 0, 2), up);
        val consumeSlots as int[string] = {};
        var mmMatchedItem as string = null;
        for slot, item in inputBus {
            if (isNull(item) || !input.matches(item.withAmount(1))) 
                continue;
            val itemNameWithMeta = item.definition.id ~ item.metadata;
            if (isNull(mmMatchedItem)) {
                mmMatchedItem = itemNameWithMeta;
            }
            if (itemNameWithMeta != mmMatchedItem && !(consumeSlots has itemNameWithMeta)) {
                consumeSlots[itemNameWithMeta] = slot;
            }
        }
        for key, slot in consumeSlots {
            val item = inputBus.getStackInSlot(slot);
            inputBus.setStackInSlot(slot, item.amount == 1 ? null : item.withAmount(item.amount - 1));
        }
        controller.customData = {Extras: consumeSlots.length};
    })
    .addPostTickHandler(function(event as RecipeTickEvent) {
        val controller = event.controller;
        val extra = controller.customData.deepGetInt("Extras");
        val extraOil = Math.round(0.00018939 * pow(extra, 5) - 0.01044 * pow(extra, 4) + 0.1532 * pow(extra, 3) + 0.3753 * pow(extra, 2) + 79.48 * extra);
        val preTickOutput = extraOil / 800;
        val moduloOutput = extraOil % 800;
        val outputBus = controller.world.getLiquidHandler(controller.relativePos(-2, 0, 2), up);
        if (event.activeRecipe.tick <= moduloOutput) {
            outputBus.fill(<liquid:oil> * (preTickOutput + 1), true);
        } else if (preTickOutput != 0) {
            outputBus.fill(<liquid:oil> * preTickOutput, true);
        }
    })
    .addRecipeTooltip(game.localize("modpack.tooltip.oil_fabricator.0"), game.localize("modpack.tooltip.oil_fabricator.1"))
    .build();

RecipeBuilder.newBuilder("blood_crystal", "blood_resonator", 200)
    .addItemInputs(<contenttweaker:flesh_crystal>, <bloodmagic:slate:2>, <bloodtinker:blood_bronze_ingot>, <bloodmagic:item_demon_crystal>)
    .addFluidPerTickInput(<liquid:lifeessence> * 10)
    .addWillInput("DEFAULT", 10)
    .addItemOutput(<contenttweaker:blood_crystal>)
    .build();
