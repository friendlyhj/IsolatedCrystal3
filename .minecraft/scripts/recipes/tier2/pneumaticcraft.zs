#reloadable

import mods.pneumaticcraft.thermopneumaticprocessingplant as TPP;
import mods.pneumaticcraft.pressurechamber as PressureChamber;

TPP.removeRecipe(<liquid:plastic>);
TPP.addRecipe(<liquid:vinyl_chloride> * 200, null, 1.5, 423, <fluid:plastic> * 1000);
PressureChamber.addRecipe([
    <astralsorcery:blockmarble> * 4, 
    <botania:quartz:5> * 2, 
    <contenttweaker:earth_crystal>, 
    <contenttweaker:ocean_crystal>
], 4.5f, [<astralsorcery:blockcustomore>]);
PressureChamber.removeRecipe([
    <pneumaticcraft:plastic:2> * 2,
    <minecraft:rotten_flesh> * 2,
    <minecraft:gunpowder> * 2,
    <minecraft:spider_eye> * 2,
    <minecraft:water_bucket>
]);
PressureChamber.addRecipe([
    <forge:bucketfilled>.withTag({FluidName: "h2so4", Amount: 1000}),
    <thaumcraft:salis_mundus> * 4
], 1.5f, [<forge:bucketfilled>.withTag({FluidName: "etchacid", Amount: 1000})]);
