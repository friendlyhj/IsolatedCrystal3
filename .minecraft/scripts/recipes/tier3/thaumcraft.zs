#reloadable

import mods.thaumcraft.Infusion;

Infusion.registerRecipe("metal_infuser", "", <mekanism:machineblock:8>, 2, [
    <aspect:potentia> * 60,
    <aspect:machina> * 60,
    <aspect:metallum> * 60,
    <aspect:exitium> * 25
], <mekanism:basicblock:8>, [
    <contenttweaker:logic_crystal>,
    <contenttweaker:logic_crystal>,
    <contenttweaker:logic_crystal>,
    <contenttweaker:logic_crystal>,
    <contenttweaker:warp_crystal>,
    <contenttweaker:warp_crystal>,
    <thermalfoundation:material:1024>,
    <thermalfoundation:material:1024>
]);

Infusion.registerRecipe("electric_separator", "", <mekanism:machineblock2:4>, 2, [
    <aspect:potentia> * 60,
    <aspect:machina> * 60,
    <aspect:permutatio> * 60,
    <aspect:exitium> * 25
], <mekanism:basicblock:8>, [
    <mekanism:controlcircuit:1>,
    <mekanism:controlcircuit:1>,
    <mekanism:electrolyticcore>,
    <mekanism:electrolyticcore>,
    <mekanism:gastank>,
    <mekanism:gastank>,
    <factorytech:tankblock>,
    <botania:manaresource:2>
]);
