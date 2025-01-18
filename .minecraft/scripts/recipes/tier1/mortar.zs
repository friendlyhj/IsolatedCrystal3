import mods.advancedmortars.Mortar;

static allLevels as string[] = ["wood", "stone", "iron", "diamond"];

Mortar.addRecipe(allLevels, <minecraft:gravel>, 8, [<botania:manaresource:21> * 4]);
Mortar.addRecipe(allLevels, <minecraft:sand>, 6, [<minecraft:gravel>]);
Mortar.addRecipe(allLevels, <naturesaura:gold_powder> * 2, 6, [<naturesaura:gold_leaf>]);
Mortar.addRecipe(allLevels, <minecraft:dye:15> * 5, 8, [<contenttweaker:blood_clot>, <contenttweaker:jade_leaf> * 4]);
Mortar.addRecipe(allLevels, <contenttweaker:crushed_crushed> * 3, 24, [<advancedmortars:mortar:1>]);
Mortar.addRecipe(allLevels, <contenttweaker:sand_dust>, 8, [<minecraft:sand>]);

recipes.replaceAllOccurrences(<minecraft:flint>, <contenttweaker:purple_fruit> | <contenttweaker:crushed_crushed>, <advancedmortars:mortar:*>);
