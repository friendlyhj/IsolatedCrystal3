#priority 40
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import scripts.grassUtils.RecipeUtils.getMetalNameNew;
import scripts.grassUtils.RecipeUtils.createFull3;

for item in <item:contenttweaker:material_part>.definition.subItems {
    val ore as IOreDictEntry = item.ores[0];
    val ingotName as string = getMetalNameNew(ore, "ingot");
    if (!isNull(ingotName)) {
        furnace.addRecipe(item, oreDict.get("dust" ~ ingotName));
        recipes.addShaped(item, createFull3(oreDict.get("nugget" ~ ingotName)));
        recipes.addShaped(oreDict.get("nugget" ~ ingotName).firstItem.withAmount(9), [[item]]);
        continue;
    }
}