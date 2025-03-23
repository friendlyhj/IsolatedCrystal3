#reloadable

import mods.botania.ManaInfusion;
import mods.botania.Apothecary;
import mods.botania.RuneAltar;
import mods.botania.Orechid;

ManaInfusion.addInfusion(<minecraft:blaze_rod>, <botania:blazeblock>, 500);
ManaInfusion.addAlchemy(<minecraft:quartz>, <appliedenergistics2:material>, 2000);
ManaInfusion.addAlchemy(<appliedenergistics2:material>, <minecraft:quartz>, 2000);
ManaInfusion.addInfusion(<minecraft:reeds>, <minecraft:hay_block>, 1000);
ManaInfusion.removeRecipe(<minecraft:sand>);
ManaInfusion.addInfusion(<contenttweaker:mana_essence>, <botania:petal:*>, 10000);

Apothecary.removeRecipe("orechid");
Apothecary.addRecipe("orechid", [<ore:petalLightGray>, <ore:petalLightGray>, <ore:petalRed>, <ore:petalYellow>, <ore:petalCyan>, <ore:petalBlue>, <ore:petalBrown>, <ore:petalBlack>, <contenttweaker:earth_crystal>]);
Apothecary.addRecipe(<naturesaura:gold_fiber>, [<ore:petalYellow>, <ore:petalYellow>, <ore:petalYellow>, <ore:petalYellow>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:nuggetGold>, <ore:nuggetGold>]);

RuneAltar.addRecipe(<contenttweaker:crafting_crystal>, [
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <botania:manaresource:23>,
    <appliedenergistics2:material>
], 6000);

RuneAltar.removeRecipe(<botania:rune:1>);
RuneAltar.addRecipe(<botania:rune:1> * 2, [
    <botania:manaresource:23>,
    <botania:manaresource>,
    <contenttweaker:heated_crystal>,
    <minecraft:blaze_powder>,
    <minecraft:gunpowder>
], 5200);

RuneAltar.removeRecipe(<botania:rune:6>);
RuneAltar.addRecipe(<botania:rune:6> * 2, [
    <botania:rune:1>,
    <botania:rune:3>,
    <ore:treeLeaves>,
    <ore:treeLeaves>,
    <ore:treeLeaves>,
    <naturesaura:gold_leaf>
], 8000);

RuneAltar.removeRecipe(<botania:rune:2>);
RuneAltar.addRecipe(<botania:rune:2> * 2, [
    <botania:manaresource:23>,
    <botania:manaresource>,
    <minecraft:stone>,
    <minecraft:coal_block>,
    <contenttweaker:earth_crystal>
], 5200);

RuneAltar.addRecipe(<tconstruct:slime_grass>, [
    <minecraft:dirt>,
    <contenttweaker:vibrant_crystal>,
    <contenttweaker:vibrant_crystal>,
    <contenttweaker:earth_crystal>,
    <contenttweaker:ocean_crystal>,
    <botania:rune>,
    <botania:rune:5>
], 12000);

Apothecary.addRecipe(<tconstruct:slime_sapling>, [
    <ore:petalLightBlue>,
    <ore:petalLightBlue>,
    <ore:petalLightBlue>,
    <ore:petalLightBlue>,
    <naturesaura:ancient_sapling>,
    <botania:rune:4>,
    <botania:rune>
]);

Apothecary.addRecipe(<tconstruct:slime_sapling:1>, [
    <ore:petalPurple>,
    <ore:petalPurple>,
    <ore:petalPurple>,
    <ore:petalPurple>,
    <naturesaura:ancient_sapling>,
    <botania:rune:4>,
    <botania:rune>
]);

Apothecary.addRecipe(<tconstruct:slime_sapling:2>, [
    <ore:petalOrange>,
    <ore:petalOrange>,
    <ore:petalOrange>,
    <ore:petalOrange>,
    <naturesaura:ancient_sapling>,
    <botania:rune:4>,
    <botania:rune:1>
]);

for od in native.vazkii.botania.api.BotaniaAPI.oreWeights {
    Orechid.removeOre(od);
}

Orechid.addOre("oreIron", 400);
Orechid.addOre("oreCoal", 500);
Orechid.addOre("oreCopper", 220);
Orechid.addOre("oreTin", 180);
Orechid.addOre("oreSilver", 125);
Orechid.addOre("oreLead", 125);
Orechid.addOre("oreGold", 100);
Orechid.addOre("oreNickel", 100);
Orechid.addOre("oreAluminum", 120);
Orechid.addOre("orePlatinum", 5);
Orechid.addOre("oreRedstone", 100);
Orechid.addOre("oreLapis", 96);
Orechid.addOre("oreDiamond", 20);
Orechid.addOre("oreEmerald", 10);
Orechid.addOre("oreCertusQuartz", 115);
Orechid.addOre("oreChargedCertusQuartz", 4);
Orechid.addOre("oreCinnabar", 75);
Orechid.addOre("oreOsmium", 90);
Orechid.addOre("oreUranium", 50);
