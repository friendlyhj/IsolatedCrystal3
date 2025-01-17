import mods.naturesaura.Altar;
import mods.naturesaura.TreeRitual;

Altar.addRecipe("fel_pumpkin", <minecraft:pumpkin>, <botania:felpumpkin>, null, 15000, 80);
TreeRitual.addRecipe("mana_pearl", <minecraft:sapling>, <botania:manaresource:1>, 100, [<appliedenergistics2:material>, <appliedenergistics2:material>, <minecraft:dye:4>, <minecraft:dye:4>, <minecraft:dye:4>, <minecraft:dye:4>, <botania:manaresource>, <minecraft:glass>]);
TreeRitual.addRecipe("vibrant_crystal", <minecraft:sapling>, <contenttweaker:vibrant_crystal>, 120, [<contenttweaker:jade_leaf>, <contenttweaker:jade_leaf>, <contenttweaker:jade_leaf>, <contenttweaker:jade_leaf>, <botania:manaresource:3>, <minecraft:wheat>]);
TreeRitual.removeRecipe(<naturesaura:eye>);
TreeRitual.addRecipe("eye", <minecraft:sapling>, <naturesaura:eye>, 150, [<botania:manaresource:1>, <minecraft:gold_ingot>, <naturesaura:gold_leaf>, <naturesaura:gold_leaf>]);
