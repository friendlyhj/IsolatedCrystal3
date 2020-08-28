#priority 40
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.inspirations.Cauldron;
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

for i in 0 .. 1 {
    val item as IItemStack = itemUtils.getItem("contenttweaker:sub_block_holder_" ~ i);
    for subItem in item.definition.subItems {
        val blockName as string = getMetalNameNew(subItem.ores[0], "block");
        if (!isNull(blockName)) {
            val ingot as IOreDictEntry = oreDict.get("ingot" ~ blockName);
            if (!ingot.empty) {
                recipes.addShaped(ingot.firstItem.withAmount(9), [[subItem]]);
                recipes.addShaped(subItem, createFull3(ingot));
            }
        }
    }
}

// 漆包线
Cauldron.addFluidRecipe(<item:contenttweaker:varnished_copper_wire>, <ore:wireCopper>, <fluid:resin>);
Cauldron.addFluidRecipe(<item:contenttweaker:varnished_electrum_wire>, <ore:wireElectrum>, <fluid:resin>);