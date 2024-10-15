#reloadable

import mods.botania.ManaInfusion;
import mods.botania.Apothecary;
import mods.botania.RuneAltar;


ManaInfusion.addInfusion(<minecraft:blaze_rod>, <botania:blazeblock>, 500);
ManaInfusion.addAlchemy(<minecraft:quartz>, <appliedenergistics2:material>, 5000);
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
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <contenttweaker:completed_afflatus_of_crafting>,
    <botania:manaresource:23>,
    <appliedenergistics2:material>
], 42000);

RuneAltar.removeRecipe(<botania:rune:1>);
RuneAltar.addRecipe(<botania:rune:1> * 2, [
    <botania:manaresource:23>,
    <botania:manaresource>,
    <contenttweaker:heated_crystal>,
    <minecraft:blaze_powder>,
    <minecraft:gunpowder>
], 5200);

RuneAltar.removeRecipe(<botania:rune:2>);
RuneAltar.addRecipe(<botania:rune:2> * 2, [
    <botania:manaresource:23>,
    <botania:manaresource>,
    <ore:stone>,
    <minecraft:coal_block>,
    <contenttweaker:earth_crystal>
], 5200);

// RuneAltar.addRecipe(<naturesaura:offering_table>, [
//     <botania:livingwood>, <botania:livingwood>, <botania:livingwood>, 
//     <naturesaura:infused_iron>, <naturesaura:infused_iron>, 
//     <minecraft:chicken>, <minecraft:beef>, <minecraft:porkchop>, <minecraft:mutton>, <naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:overworld"}), 
//     <botania:rune:4>, <botania:rune:5>, <botania:rune:6>, <botania:rune:7>
// ], 150000);
