#reloadable

import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;


function newEssentiaGeneratorRecipe(item as IItemStack, aspect as string) as void {
    RecipeBuilder.newBuilder(aspect, "essentia_generator", 100)
        .addAspectOutput(aspect, 16)
        .addItemInput(item)
        .addManaInput(8000, false)
        .build();
}

newEssentiaGeneratorRecipe(<contenttweaker:flesh_crystal>, "victus");
newEssentiaGeneratorRecipe(<contenttweaker:heated_crystal>, "ignis");
newEssentiaGeneratorRecipe(<contenttweaker:earth_crystal>, "terra");
newEssentiaGeneratorRecipe(<contenttweaker:vibrant_crystal>, "herba");
newEssentiaGeneratorRecipe(<contenttweaker:crafting_crystal>, "fabrico");
newEssentiaGeneratorRecipe(<contenttweaker:ocean_crystal>, "aqua");
newEssentiaGeneratorRecipe(<contenttweaker:destruction_crystal>, "vacuos");
