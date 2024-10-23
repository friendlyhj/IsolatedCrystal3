#reloadable
import mods.thaumcraft.Crucible;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;

Crucible.removeRecipe(<thaumcraft:ingot:2>);
Crucible.registerRecipe("brass", "", <thaumcraft:ingot:2>, <ore:ingotBronze>, [<aspect:instrumentum> * 5]);
ArcaneWorkbench.removeRecipe(<thaumcraft:tube>);
ArcaneWorkbench.removeRecipe(<thaumcraft:mechanism_simple>);
ArcaneWorkbench.removeRecipe(<thaumcraft:centrifuge>);
ArcaneWorkbench.removeRecipe(<thaumadditions:aspect_combiner>);
ArcaneWorkbench.removeRecipe(<thaumcraft:filter>);
Crucible.registerRecipe("undead_water", "", <forge:bucketfilled>.withTag({FluidName: "undead_water", Amount: 1000}), <minecraft:water_bucket>, [<aspect:exanimis> * 20]);

Infusion.registerRecipe("wrap_crystal", "", <contenttweaker:warp_crystal>, 5.0, [
    <aspect:vitium> * 40, <aspect:vitreus> * 20, <aspect:tenebrae> * 10, <aspect:potentia> * 10
], 
<contenttweaker:destruction_crystal>, [
    <thaumcraft:void_seed>,
    <thaumcraft:void_seed>, 
    <thaumcraft:vishroom>, 
    <thaumcraft:quicksilver>, 
    <appliedenergistics2:material:2>, 
    <ore:dustSilver>,
    <ore:ingotThaumium>,
    <minecraft:lapis_block>,
    <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "alienis"}]}),
    <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "auram"}]})
]);
