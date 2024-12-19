import mods.botaniatweaks.Agglomeration;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.AgglomerationMultiblock;
import crafttweaker.item.IItemStack;

val matrix as IItemStack = <appliedenergistics2:matrix_frame>;

Agglomeration.addRecipe(<contenttweaker:space_grid>, [
    <thaumcraft:infusion_matrix>,
    <appliedenergistics2:spatial_pylon>,
    <appliedenergistics2:material:32>,
    <mekanism:cosmicmatter>
], 250000, 0xffffff, 0x43ffdb, matrix, matrix, matrix, matrix, matrix, matrix);
