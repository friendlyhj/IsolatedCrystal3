#reloadable

import mods.bloodmagic.BloodAltar;
import mods.bloodmagic.TartaricForge;

BloodAltar.removeRecipe(<minecraft:stone>);
BloodAltar.removeRecipe(<minecraft:cobblestone>);
BloodAltar.removeRecipe(<minecraft:lapis_block>);
BloodAltar.removeRecipe(<minecraft:magma_cream>);
BloodAltar.removeRecipe(<minecraft:obsidian>);
BloodAltar.removeRecipe(<minecraft:ghast_tear>);
BloodAltar.removeRecipe(<minecraft:coal_block>);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:1>.withTag({uses: 10}), <botania:rune>, 2, 1000, 5, 5);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:2>.withTag({uses: 10}), <botania:rune:1>, 2, 1000, 5, 5);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:3>.withTag({uses: 10}), <botania:rune:2>, 2, 1000, 5, 5);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:4>.withTag({uses: 10}), <botania:rune:3>, 2, 1000, 5, 5);
BloodAltar.addRecipe(<bloodmagic:inscription_tool:5>.withTag({uses: 10}), <botaniverse:morerune:2>, 3, 4000, 10, 10);
TartaricForge.removeRecipe([<minecraft:redstone>, <minecraft:gold_ingot>, <minecraft:glass>, <minecraft:dye:4>]);
TartaricForge.addRecipe(<bloodmagic:soul_gem>, [<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "infernum"}]}), <contenttweaker:flesh_crystal>, <minecraft:dye:4>, <minecraft:quartz>], 1.0, 0.05);
