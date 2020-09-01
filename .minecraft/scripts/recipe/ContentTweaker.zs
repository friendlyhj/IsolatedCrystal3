#priority 40
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.inspirations.Cauldron;
import scripts.grassUtils.RecipeUtils.getMetalNameNew;
import scripts.grassUtils.RecipeUtils.createFull3;
import scripts.grassUtils.RecipeUtils.createFull2;

for item in <item:contenttweaker:material_part>.definition.subItems {
    var ore as IOreDictEntry = item.ores[0];
    if (ore.name == "ingotCopper") ore = <ore:ingotCopperRefined>;
    val ingotName as string = getMetalNameNew(ore, "ingot");
    if (!isNull(ingotName)) {
        furnace.addRecipe(item, oreDict.get("dust" ~ ingotName));
        recipes.addShaped(item, createFull3(oreDict.get("nugget" ~ ingotName)));
        recipes.addShaped(oreDict.get("nugget" ~ ingotName).firstItem.withAmount(9), [[item]]);
        val block as IOreDictEntry = oreDict.get("block" ~ ingotName);
        recipes.addShaped(item * 9, [[block]]);
        recipes.addShaped(block.firstItem, createFull3(ore));
        continue;
    }
    val smallDustName as string = getMetalNameNew(ore, "dustSmall");
    if (!isNull(smallDustName)) {
        val dust as IOreDictEntry = oreDict.get("dust" ~ smallDustName);
        recipes.addShaped(dust.firstItem, createFull2(item));
        recipes.addShaped(item * 4, [[dust]]);
    }
}

/* for i in 0 .. 1 {
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
} */

// 漆包线
Cauldron.addFluidRecipe(<item:contenttweaker:varnished_copper_wire>, <ore:wireCopper>, <fluid:resin>);
Cauldron.addFluidRecipe(<item:contenttweaker:varnished_electrum_wire>, <ore:wireElectrum>, <fluid:resin>);

// 魔力电烙铁
recipes.addShaped("soldering_manasteel", <item:contenttweaker:soldering_manasteel>, [
    [null, <ore:ingotManasteel>, null],
    [<ore:ingotManasteel>, null, <ore:ingotManasteel>],
    [null, <forge:bucketfilled>.withTag({FluidName: "resin", Amount: 1000}), <ore:livingwood>]
]);