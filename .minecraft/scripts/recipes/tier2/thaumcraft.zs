#reloadable
import mods.thaumcraft.Crucible;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;
import mods.contenttweaker.MaterialSystem;
import mods.zenutils.StaticString;

Crucible.removeRecipe(<thaumcraft:ingot:2>);
Crucible.registerRecipe("brass", "", <thaumcraft:ingot:2>, <ore:ingotBronze>, [<aspect:instrumentum> * 5]);
ArcaneWorkbench.removeRecipe(<thaumcraft:tube>);
ArcaneWorkbench.removeRecipe(<thaumcraft:mechanism_simple>);
ArcaneWorkbench.removeRecipe(<thaumcraft:centrifuge>);
ArcaneWorkbench.removeRecipe(<thaumadditions:aspect_combiner>);
ArcaneWorkbench.removeRecipe(<thaumcraft:filter>);
ArcaneWorkbench.removeRecipe(<thaumcraft:metal_alchemical>);
ArcaneWorkbench.removeRecipe(<thaumicenergistics:essentia_terminal>);
ArcaneWorkbench.removeRecipe(<thaumicenergistics:arcane_terminal>);
ArcaneWorkbench.removeRecipe(<thaumicenergistics:arcane_inscriber>);
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

Infusion.registerRecipe("essentia_module", "", <contenttweaker:essentia_module>, 3.0, [
    <aspect:machina> * 20, <aspect:auram> * 20, <aspect:permutatio> * 20
],
<appliedenergistics2:material:28>, [
    <contenttweaker:warp_crystal>,
    <contenttweaker:warp_crystal>,
    <thaumcraft:salis_mundus>,
    <thaumcraft:quicksilver>
]);

for name, part in MaterialSystem.getMaterialPartsByRegex(".*ore_sacrifice.*") {
    val materialName = part.getMaterial().getName();
    val block = oreDict.get("block" ~ StaticString.capitalize(materialName));
    Infusion.registerRecipe(name, "", part.getItemStack(), 7.5, [
        <aspect:desiderium> * 50, <aspect:terra> * 40, <aspect:alienis> * 20, <aspect:vacuos> * 20
    ], block, [
        <contenttweaker:metal_crystal>,
        <contenttweaker:metal_crystal>,
        <contenttweaker:astral_crystal>,
        <contenttweaker:astral_crystal>
    ]);
}
