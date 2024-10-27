#reloadable

import mods.bloodmagic.BloodAltar;
import mods.bloodmagic.TartaricForge;

BloodAltar.removeRecipe(<minecraft:stone>);
BloodAltar.addRecipe(<minecraft:netherrack>, <minecraft:cobblestone>, 0, 800, 20, 20);
TartaricForge.removeRecipe([<minecraft:redstone>, <minecraft:gold_ingot>, <minecraft:glass>, <minecraft:dye:4>]);
TartaricForge.addRecipe(<bloodmagic:soul_gem>, [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "infernum"}]}), <contenttweaker:flesh_crystal>, <minecraft:dye:4>, <minecraft:quartz>], 1.0, 0.05);
