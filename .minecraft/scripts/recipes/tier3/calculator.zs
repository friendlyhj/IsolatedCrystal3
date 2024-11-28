import mods.calculator.basic as Basic;
import mods.calculator.scientific as Scientific;
import mods.calculator.atomic as Atomic;
import mods.calculator.flawless as Flawless;
import mods.calculator.algorithmSeparator as AlgorithmSeparator;
import mods.calculator.stoneSeparator as StoneSeparator;

Basic.removeRecipe(<calculator:reinforcedironingot>);
Basic.addRecipe(<factorytech:ingot:4>, <sonarcore:reinforcedstoneblock>, <calculator:reinforcedironingot>);
Basic.removeRecipe(<calculator:enrichedgold>);
Basic.addRecipe(<enderio:item_alloy_ingot:1>, <contenttweaker:metal_crystal>, <calculator:enrichedgold> * 4);
Basic.removeRecipe(<sonarcore:stablestone_normal>);
Flawless.addRecipe(<sonarcore:reinforcedstonebrick>, <enderio:block_alloy:6>, <thaumicaugmentation:material:1>, <sonarcore:reinforcedstonebrick>, <sonarcore:stablestone_normal>);
Flawless.removeRecipe(<minecraft:ender_pearl>);
Flawless.removeRecipe(<minecraft:diamond>);
Flawless.removeRecipe(<minecraft:emerald>);
Flawless.removeRecipe(<minecraft:obsidian>);
Flawless.removeRecipe(<minecraft:blaze_rod>);

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

