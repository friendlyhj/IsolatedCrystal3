#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import scripts.grassUtils.RecipeUtils.getMetalNameNew;
import scripts.recipe.Mortar.allMortarTypes;
import mods.advancedmortars.Mortar;

for entry in oreDict.entries {
    // dust
    val dustName as string = getMetalNameNew(entry, "dust");
    if (!isNull(dustName)) {
        val ingot as IOreDictEntry = oreDict.get("ingot" ~ dustName);
        if (!ingot.empty) {
            Mortar.addRecipe(allMortarTypes, entry.firstItem, 6, [ingot]);
        }
        continue;
    }
}