#priority 40
#ignoreBracketErrors
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.inspirations.Cauldron;
import scripts.grassUtils.RecipeUtils.getMetalNameNew;
import scripts.grassUtils.RecipeUtils.createFull3;
import scripts.grassUtils.RecipeUtils.createFull2;
import scripts.grassUtils.RecipeUtils.createSurround;
import scripts.grassUtils.RecipeUtils.createCross;
import scripts.recipe.Util.addCrushRecipe;
import scripts.recipe.modularMachinery.Programmer;
import mods.botania.ManaInfusion;
import mods.botania.ElvenTrade;
import mods.botaniatweaks.Agglomeration;
import mods.jei.JEI;
import scripts.compatSkills.SkillLocker;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.compatSkills.Utils.toAllSkill;
import mods.artisanintegrations.requirement.Reskillable;
import mods.artisanworktables.builder.RecipeBuilder;

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
    val wirecoilName as string = getMetalNameNew(ore, "wirecoil");
    if (!isNull(wirecoilName)) {
        val wire as IOreDictEntry = oreDict.get("wire" ~ wirecoilName);
        recipes.addShaped(item * 2, [
            [null, wire, null],
            [wire, <ore:stickTreatedWood>, wire],
            [null, wire, null]
        ]);
        continue;
    }
    val wireName as string = getMetalNameNew(ore, "wire");
    if (!isNull(wireName)) {
        val plate as IOreDictEntry = oreDict.get("plate" ~ wireName);
        recipes.addShapeless(item, [plate, <item:immersiveengineering:tool:1>]);
        continue;
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

// 热空气检测器
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateFerramic>, <minecraft:comparator>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <prodigytech:air_funnel>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <ore:barsIron>, <ore:plateFerramic>]])
  .addTool(<ore:artisansHammer>, 10)
  .addTool(<contenttweaker:soldering_manasteel>, 2)
  .addOutput(<isolatedcrystalutils:hot_air_checker>)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3n4i3"))))
.create();
SkillLocker.lockItem(<isolatedcrystalutils:hot_air_checker>, getSkillArray("m3n4i3"));

JEI.addDescription(<item:isolatedcrystalutils:hot_air_checker>, game.localize("isc.jeidesc.hot_air_checker"));

// 无限之石
ElvenTrade.addRecipe([<item:contenttweaker:infinite_rock>], [<ore:obsidian>, <ore:obsidian>, <ore:dustEnergion>]);

// 光学玻璃
recipes.addShaped("optical_glass", <item:contenttweaker:optical_glass> * 4, createCross(<ore:dustIndium>, <item:appliedenergistics2:quartz_vibrant_glass>));

// 镍铬加热线圈
recipes.addShaped("nichrome_heating_wirecoil", <item:contenttweaker:nichrome_wirecoil_block>, createSurround(<ore:ingotElectricalSteel>, <ore:wirecoilNichrome>));

// 石英砂
recipes.addShapeless("crystal_sand", <item:contenttweaker:crystal_sand> * 3, [<ore:sand>, <ore:sand>, <ore:sand>, <ore:dustCertusQuartz> | <ore:dustNetherQuartz>]);

// 模块
val card as IOreDictEntry = <ore:cardBasic>;
Programmer.addRecipeWithOre("craft", [card, <ore:workbench>, <ore:ingotEnchantedMetal>, <ore:processorCalculate>], [1, 1, 2, 1], [<item:contenttweaker:crafting_module>], 400, 80, 250);
Programmer.addRecipeWithOre("network", [card, <ore:crystalPureFluix>, <ore:ingotManasteel>, <ore:processorEnder>], [1, 2, 1, 1], [<item:contenttweaker:network_module>], 400, 80, 250);
Programmer.addRecipeWithOre("item", [card, <ore:crystalPureCertusQuartz>, <ore:ingotConductiveIron>, <ore:processorLogic>], [1, 2, 4, 1], [<item:contenttweaker:item_module>], 400, 80, 250);
Programmer.addRecipeWithOre("redstone", [card, <ore:crystalPureNetherQuartz>, <ore:dustRedstone>, <ore:processorCalculate>], [1, 2, 4, 1], [<item:contenttweaker:redstone_module>], 400, 80, 250);
Programmer.addRecipe("advanced_network", [<ore:cardAdvanced>.firstItem, <item:contenttweaker:network_module> * 4, <ore:processorEngineering>.firstItem * 2, <ore:circuitPerfect>.firstItem * 2], [<item:contenttweaker:advanced_network_module>], 800, 160, 1000);
Programmer.addRecipeWithOre("usb", [card, <ore:nuggetInvar>, <ore:nuggetTitanium>, <ore:plateSteel>, <ore:processorEnder>], [1, 3, 3, 1, 1], [<item:contenttweaker:usb_module> * 2], 400, 80, 250);
Programmer.addRecipeWithOre("write", [card, <ore:ingotVibrantAlloy>, <ore:ingotConductiveIron>, <ore:dustHOPGraphite>, <ore:processorEngineering>], [1, 1, 4, 1, 1], [<item:contenttweaker:write_module>], 400, 80, 500);
