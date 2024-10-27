#reloadable
import mods.botania.ElvenTrade;
import mods.botania.PureDaisy;

ElvenTrade.addRecipe([<thaumcraft:sapling_silverwood>], [
    <contenttweaker:vibrant_crystal>, 
    <contenttweaker:vibrant_crystal>, 
    <contenttweaker:vibrant_crystal>, 
    <naturesaura:infused_iron>, 
    <naturesaura:infused_iron>,
    <botania:rune:8>
]);
ElvenTrade.addRecipe([<thaumcraft:sapling_greatwood>], [
    <contenttweaker:vibrant_crystal>, 
    <contenttweaker:vibrant_crystal>, 
    <contenttweaker:vibrant_crystal>, 
    <naturesaura:ancient_sapling>, 
    <naturesaura:ancient_sapling>, 
    <botania:rune:2>
]);
ElvenTrade.addRecipe([<thaumcraft:ingot:2>], [
    <ore:ingotBronze>, 
    <ore:ingotBronze>, 
    <ore:ingotConstantan>, 
    <ore:ingotConstantan>, 
    <ore:ingotAlubrass>,
    <ore:ingotAlubrass>
]);
PureDaisy.addRecipe(<naturesaura:infused_stone>, <sonarcore:reinforcedstoneblock>);
PureDaisy.addRecipe(<sonarcore:reinforcedstoneblock>, <bloodmagic:blood_rune>);
PureDaisy.addRecipe(<bloodmagic:blood_rune>, <chisel:limestone2:7>);
PureDaisy.addRecipe(<chisel:limestone2:7>, <astralsorcery:blockmarble>);
PureDaisy.addRecipe(<astralsorcery:blockmarble>, <naturesaura:infused_stone>);
