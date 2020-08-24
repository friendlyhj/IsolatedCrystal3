#priority 40
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import scripts.grassUtils.RecipeUtils.getMetalNameNew;

for item in <item:contenttweaker:material_part>.definition.subItems {
    val ore as IOreDictEntry = item.ores[0];
    val ingotName as string = getMetalNameNew(ore, "ingot");
    if (!isNull(ingotName)) {
        furnace.addRecipe(item, oreDict.get("dust" ~ ingotName));
        continue;
    }
}