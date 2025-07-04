import mods.calculator.basic as Basic;
import mods.calculator.scientific as Scientific;
import mods.calculator.atomic as Atomic;
import mods.calculator.flawless as Flawless;
import mods.calculator.algorithmSeparator as AlgorithmSeparator;
import mods.calculator.stoneSeparator as StoneSeparator;
import crafttweaker.item.IItemStack;

import native.sonar.calculator.mod.common.recipes.AnalysingChamberRecipes;
import native.sonar.core.integration.crafttweaker.SonarRemoveRecipe;
import native.sonar.core.recipes.RecipeObjectType;
import native.crafttweaker.CraftTweakerAPI;


Basic.removeRecipe(<calculator:reinforcedironingot>);
Basic.removeRecipe(<sonarcore:reinforcedstoneblock>);
Basic.removeRecipe(<sonarcore:reinforcedstoneblock> * 4);
Basic.addRecipe(<factorytech:ingot:4>, <sonarcore:reinforcedstoneblock>, <calculator:reinforcedironingot>);
Basic.removeRecipe(<calculator:enrichedgold>);
Basic.addRecipe(<enderio:item_alloy_ingot:1>, <contenttweaker:metal_crystal>, <calculator:enrichedgold> * 4);
Basic.removeRecipe(<sonarcore:stablestone_normal> * 2);
Flawless.addRecipe(<sonarcore:reinforcedstonebrick>, <enderio:block_alloy:6>, <thaumicaugmentation:material:1>, <sonarcore:reinforcedstonebrick>, <sonarcore:stablestone_normal>);
Flawless.removeRecipe(<minecraft:ender_pearl>);
Flawless.removeRecipe(<minecraft:diamond>);
Flawless.removeRecipe(<minecraft:emerald>);
Flawless.removeRecipe(<minecraft:obsidian>);
Flawless.removeRecipe(<minecraft:blaze_rod>);
Flawless.addRecipe(<minecraft:sea_lantern>, <actuallyadditions:item_misc:24>, <bloodmagic:slate:4>, <minecraft:sea_lantern>, <contenttweaker:crystal_alga_seeds>);
Atomic.addRecipe(<calculator:healthprocessor>, <calculator:atomicbinder>, <calculator:calculatorscreen>, <calculator:healthmodule>);
Atomic.addRecipe(<calculator:hungerprocessor>, <calculator:atomicbinder>, <calculator:calculatorscreen>, <calculator:hungermodule>);
Atomic.removeRecipe(<calculator:nutritionmodule>);
Atomic.addRecipe(<calculator:healthmodule>, <calculator:energymodule>, <calculator:hungermodule>, <calculator:nutritionmodule>);

Scientific.addRecipe(<astralsorcery:itemcraftingcomponent>, <contenttweaker:warp_crystal>, <calculator:smalltanzanite>);
Scientific.addRecipe(<appliedenergistics2:material:7>, <contenttweaker:warp_crystal>, <calculator:smallamethyst>);
AlgorithmSeparator.removeRecipe(<calculator:smalltanzanite>, <calculator:shardtanzanite>);
AlgorithmSeparator.removeRecipe(<calculator:largetanzanite>, <calculator:shardtanzanite>);
AlgorithmSeparator.removeRecipe(<calculator:weakeneddiamond> * 4, <minecraft:dye:4> * 2);
AlgorithmSeparator.removeRecipe(<calculator:redstoneingot> * 2, <calculator:smallstone>);
StoneSeparator.removeRecipe(<calculator:enrichedgold> * 4, <calculator:smallstone> * 2);
StoneSeparator.removeRecipe(<calculator:reinforcedironingot> * 4, <calculator:smallstone> * 2);
StoneSeparator.removeRecipe(<calculator:largeamethyst>, <calculator:shardamethyst>);
StoneSeparator.removeRecipe(<calculator:smallamethyst>, <calculator:shardamethyst>);

Atomic.addRecipe(<sonarcore:reinforcedstoneblock>, <embers:archaic_circuit>, <sonarcore:reinforcedstoneblock>, <thaumicaugmentation:stone>);

function removeAnalysingChamberRecipe(output as IItemStack) {
    CraftTweakerAPI.apply(SonarRemoveRecipe(AnalysingChamberRecipes.instance(), RecipeObjectType.OUTPUT, [output]));
}

function removeAnalysingChamberRecipeByInput(inputArgs as [int]) {
    val recipes = AnalysingChamberRecipes.instance();
    recipes.removeRecipe(recipes.getRecipeFromInputs(null, inputArgs));
}

// health processor
removeAnalysingChamberRecipeByInput([2, 8]);
removeAnalysingChamberRecipeByInput([3, 7]);

removeAnalysingChamberRecipe(<calculator:hungerprocessor>);
removeAnalysingChamberRecipe(<calculator:healthmodule>);
removeAnalysingChamberRecipe(<calculator:hungermodule>);
