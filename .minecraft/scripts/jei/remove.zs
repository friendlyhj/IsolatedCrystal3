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
    <embers:ember_bore>
];

for ban in banList {
    JEI.removeAndHide(ban);
}
