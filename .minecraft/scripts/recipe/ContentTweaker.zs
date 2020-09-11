#priority 40
#ignoreBracketErrors
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.inspirations.Cauldron;
import scripts.grassUtils.RecipeUtils.getMetalNameNew;
import scripts.grassUtils.RecipeUtils.createFull3;
import scripts.grassUtils.RecipeUtils.createFull2;
import scripts.recipe.Util.addCrushRecipe;
import mods.botania.ManaInfusion;
import mods.botaniatweaks.Agglomeration;
import mods.jei.JEI;

for item in <item:contenttweaker:material_part>.definition.subItems {
    val ore as IOreDictEntry = item.ores[0];
    // if (ore.name == "ingotCopper") ore = <ore:ingotCopperRefined>;
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
        continue;
    }
    val wireName as string = getMetalNameNew(ore, "wire");
    if (!isNull(wireName) && !wireName.contains("coil")) {
        val plate as IOreDictEntry = oreDict.get("plate" ~ wireName);
        recipes.addShapeless(item, [plate, <item:immersiveengineering:tool:1>]);
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
recipes.addShaped("soldering_manasteel", <item:contenttweaker:soldering_manasteel:127>, [
    [null, <ore:ingotManasteel>, null],
    [<ore:ingotManasteel>, null, <ore:ingotManasteel>],
    [null, <forge:bucketfilled>.withTag({FluidName: "resin", Amount: 1000}), <ore:livingwood>]
]);

ManaInfusion.addInfusion(<item:contenttweaker:soldering_manasteel>, <item:contenttweaker:soldering_manasteel:127>, 127 * 1000);

JEI.addItem(<item:contenttweaker:soldering_manasteel:127>);

// 大理石粉
addCrushRecipe(<ore:blockMarble>, <ore:dustMarble>, 9);

// 精灵铜锭
Agglomeration.addRecipe(<ore:ingotElvenCopper>.firstItem, [<ore:ingotCopperRefined>, <ore:elvenDragonstone>, <ore:dustRedstone>, <item:botanicadds:elven_lapis>],
200000, 0xFF0000, 0xCC6699, <ore:blockRedstone>, <ore:blockCopper>, <ore:blockRedstone>);

// 能量锡锭
Agglomeration.addRecipe(<ore:ingotEnergeticTin>.firstItem, [<ore:ingotTin>, <ore:ingotSilver>, <ore:dustEnergion>],
50000, 0xFFFFFF, 0x1BE8FF, <ore:blockTin>, <item:botania:storage>, <ore:blockTin>);

// 扭曲黑曜石
Agglomeration.addRecipe(<ore:ingotManasteel>.firstItem, [<ore:ingotTerrasteel>, <ore:ingotEnergeticTin>, <ore:ingotElvenCopper>],
400000, 0xFFFFFF, 0x4bcd5d, <ore:obsidian>, <item:actuallyadditions:block_misc:6>, <ore:livingrock>, <item:isolatedcrystalutils:warp_obsidian>, <ore:cobblestone>, <ore:stone>);
