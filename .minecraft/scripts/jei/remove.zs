#reloadable

import mods.jei.JEI;
import crafttweaker.item.IItemStack;

val banList as IItemStack[] = [
    <bloodmagic:ritual_controller:1>,
    <botania:conjurationcatalyst>,
    <emergingtechnology:collector>,
    <draconicevolution:celestial_manipulator>,
    <naturesaura:clock_hand>,
    <naturesaura:time_changer>,
    <calculator:atomicmultiplier>,
    <mekanism:mektool>,
    <mekanism:mekasuithelmet>,
    <mekanism:mekasuitchestplate>,
    <mekanism:mekasuitleggings>,
    <mekanism:mekasuitboots>,
    <mekaweapons:mekabow>,
    <mekaweapons:mekaarrow>,
    <mekaweapons:mekatana>,
    <mekanism:modulebase>,
    <mekanism:moduleupgrade:*>,
    <mekanismgenerators:generator:10>,
    <mekanismgenerators:generator:11>,
    <mekanismgenerators:generator:12>,
    <mekanismgenerators:reactor>,
    <mekanismgenerators:reactor:1>,
    <mekanismgenerators:reactor:3>,
    <mekanismgenerators:reactorglass>,
    <mekanismgenerators:reactorglass:1>,
    <mekanismgenerators:generator:8>,
    <mekanismgenerators:turbineblade>,
    <mekanismgenerators:generator:7>,
    <mekanismgenerators:solarpanel>,
    <mekanism:basicblock3>,
    <mekanism:basicblock3:1>,
    <mekanism:basicblock3:2>,
    <mekanism:basicblock3:3>,
    <embers:ember_bore>,
    <draconicevolution:generator>,
    <appliedenergistics2:vibration_chamber>,
    <actuallyadditions:block_furnace_solar>,
    <nuclearcraft:solar_panel_basic>,
    <nuclearcraft:solar_panel_advanced>,
    <nuclearcraft:solar_panel_du>,
    <nuclearcraft:solar_panel_elite>,
    <enderio:block_solar_panel:*>,
    <enderio:block_simple_alloy_smelter>,
    <enderio:block_simple_stirling_generator>,
    <enderio:block_simple_sag_mill>,
    <enderio:block_simple_wired_charger>,
    <enderio:block_simple_furnace>,
    <industrialforegoing:pitiful_fuel_generator>,
    <emergingtechnology:piezoelectric>
];

for ban in banList {
    JEI.removeAndHide(ban);
}
