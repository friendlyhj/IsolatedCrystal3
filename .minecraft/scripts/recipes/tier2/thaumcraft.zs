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
ArcaneWorkbench.removeRecipe(<thaumcraft:metal_alchemical>);
Crucible.registerRecipe("undead_water", "", <forge:bucketfilled>.withTag({FluidName: "undead_water", Amount: 1000}), <minecraft:water_bucket>, [<aspect:exanimis> * 80]);
Crucible.registerRecipe("blood_magic_dagger", "", <bloodmagic:sacrificial_dagger>, <thaumcraft:thaumium_sword>, [<aspect:victus> * 48, <aspect:mortuus> * 12]);
Crucible.registerRecipe("soul_snare", "", <bloodmagic:soul_snare>, <botania:manaresource:16>, [<aspect:vinculum> * 4]);

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
    <thaumcraft:fabric>,
    <botania:manaresource:23>
]);

Infusion.removeRecipe(<thaumadditions:aura_charger>);
