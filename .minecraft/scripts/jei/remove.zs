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
    <emergingtechnology:piezoelectric>,
    <thermalexpansion:augment:337>,
    <immersiveengineering:mold:1>,
    <immersiveengineering:metal_device1:3>,
    <thaumcraft:smelter_basic>,
    <thaumcraft:smelter_thaumium>,
    <thaumcraft:smelter_void>,
    <thaumadditions:mithrillium_smelter>,
    <thaumadditions:adaminite_smelter>,
    <thaumadditions:mithminite_smelter>,
    <industrialforegoing:material_stonework_factory>,
    <industrialforegoing:wither_builder>,
    <ae2fc:part_fluid_pattern_ex_terminal>,
    <appliedenergistics2:part:341>,
    <tconstruct:cast_custom:4>,
    <extrautils2:quarry>,
    <extrautils2:quarryproxy>,
    <extrautils2:teleporter:*>,
    <extrautils2:bagofholding>,
    <ae2fc:fluid_level_maintainer>,
    <nuclearcraft:electric_furnace>,
    <embers:dust_metallurgic>
];

for ban in banList {
    JEI.removeAndHide(ban);
}

val categoryHideList as string[] = [
    "thermalexpansion.compactor_gear",
    "artisanworktables_blacksmith_workstation",
    "artisanworktables_engineer_workstation",
    "artisanworktables_mage_workstation",
    "artisanworktables_chef_workstation",
    "artisanworktables_blacksmith_workshop",
    "artisanworktables_engineer_workshop",
    "artisanworktables_mage_workshop",
    "artisanworktables_chef_workshop",
    "thermaldynamics.covers"
];

for category in categoryHideList {
    JEI.hideCategory(category);
}
