#reloadable

import mods.thermalexpansion.InductionSmelter;
import mods.thermalexpansion.Pulverizer;
import mods.thermalexpansion.Insolator;

InductionSmelter.removeRecipe(<minecraft:iron_ingot>, <minecraft:redstone>);
InductionSmelter.removeRecipe(<thermalfoundation:material>, <minecraft:redstone>);
InductionSmelter.addRecipe(<enderio:item_alloy_ingot:4>, <factorytech:machinepart:130>, <minecraft:redstone>, 4800);
InductionSmelter.addRecipe(<thermalfoundation:material:128>, <minecraft:redstone> * 4, <projectred-core:resource_item:103>, 4800);
Pulverizer.addRecipe(<naturesaura:gold_powder> * 2, <naturesaura:gold_leaf>, 3000);
Insolator.addRecipe(<naturesaura:gold_leaf> * 3, <naturesaura:gold_leaf>, <thermalfoundation:fertilizer>, 4800);
Insolator.addRecipe(<naturesaura:gold_leaf> * 6, <naturesaura:gold_leaf>, <thermalfoundation:fertilizer:1>, 6400);
Insolator.addRecipe(<naturesaura:gold_leaf> * 9, <naturesaura:gold_leaf>, <thermalfoundation:fertilizer:2>, 9600);
