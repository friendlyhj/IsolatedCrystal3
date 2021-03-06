#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import mods.advancedmortars.Mortar;
import mods.thermalexpansion.Refinery;
import mods.mekanism.reaction;
import mods.rustic.Condenser;
import scripts.recipe.Util.allMortarTypes;
import scripts.recipe.Util.addCrushRecipe;
import scripts.recipe.extraUtilities.MachineRecipe.addChlorinizerRecipe;
import scripts.recipe.extraUtilities.MachineRecipe.addOreDresserRecipe;
import scripts.recipe.modularMachinery.AeroCokeOven;
import scripts.recipe.modularMachinery.ElectrolyticRefiner;
import scripts.recipe.modularMachinery.AeroBlast;

// alloy dust
recipes.remove(<ore:dustElectrum>.firstItem);
Mortar.addRecipe(allMortarTypes, <ore:dustElectrum>.firstItem * 2, 4, [<ore:dustGold>, <ore:dustSilver>]);
recipes.remove(<ore:dustInvar>.firstItem);
Mortar.addRecipe(allMortarTypes, <ore:dustInvar>.firstItem * 3, 4, [<ore:dustIron> * 2, <ore:dustNickel>]);
recipes.remove(<ore:dustConstantan>.firstItem);
Mortar.addRecipe(allMortarTypes, <ore:dustConstantan>.firstItem * 2, 4, [<ore:dustCopper>, <ore:dustNickel>]);
recipes.remove(<ore:dustBronze>.firstItem);
Mortar.addRecipe(allMortarTypes, <ore:dustBronze>.firstItem * 4, 4, [<ore:dustCopper> * 3, <ore:dustTin>]);
Mortar.addRecipe(allMortarTypes, <ore:dustSoldering>.firstItem * 5, 4, [<ore:dustTin> * 3, <ore:dustLead> * 2]);
Mortar.addRecipe(allMortarTypes, <ore:dustNichrome>.firstItem * 2, 4, [<ore:dustNickel>, <ore:dustChromium>]);

recipes.remove(<ore:dustSignalum>.firstItem);
recipes.remove(<ore:dustEnderium>.firstItem);
recipes.remove(<ore:dustLumium>.firstItem);

// IE 工程师锤砸板
recipes.removeByRegex("^immersiveengineering:material/plate_.*");

// ti
addCrushRecipe(<item:contenttweaker:rutile>, <item:contenttweaker:rutile_dust>, 1);
addChlorinizerRecipe(250, [<item:contenttweaker:rutile_dust>, <ore:dustCoal>.firstItem * 2 | <ore:dustCharcoal>.firstItem * 2], <liquid:raw_ticl4> * 250, 12000, 300);
Refinery.addRecipe(<liquid:ticl4> * 200, <ore:dustCoal>.firstItem % 20, <liquid:raw_ticl4> * 250, 5000);
reaction.addRecipe(<ore:plateCopper>, <liquid:ticl4> * 400, <gas:hydrogen> * 800, <ore:dustTitanium>.firstItem.withAmount(2), <gas:hydrogenchloride> * 1600, 6000, 400);

// coke
AeroCokeOven.addRecipe("coke", <item:minecraft:coal>, <item:immersiveengineering:material:6>, <fluid:creosote> * 250, 150, 400);
AeroCokeOven.addRecipeWithOre("methanol", <ore:logWood>, 1, <item:minecraft:coal:1>, <fluid:methanol> * 125, 150, 400);

// 醋
Condenser.addRecipe(<forge:bucketfilled>.withTag({FluidName: "vinegar", Amount: 1000}), [<item:rustic:chamomile>], null, <item:minecraft:bucket>, <liquid:ethanol> * 1000, 4800);

// 精铜
ElectrolyticRefiner.addRecipe("copper_basic", <ore:ingotCopper>, 1, <liquid:vinegar> * 50, 
[<ore:ingotCopperRefined>.firstItem, <ore:dustSmallNickel>.firstItem, <ore:dustSmallSilver>.firstItem, <ore:dustSmallGold>.firstItem], 
[1.0, 0.4, 0.2, 0.1], 5, 200);

ElectrolyticRefiner.addRecipe("copper_advanced", <ore:ingotCopper>, 1, <liquid:sulfuric_acid> * 10, 
[<ore:ingotCopperRefined>.firstItem, <ore:dustSmallNickel>.firstItem, <ore:dustSmallSilver>.firstItem, <ore:dustSmallGold>.firstItem], 
[1.0, 0.4, 0.2, 0.1], 20, 10);

ElectrolyticRefiner.addRecipe("copper_advanced", <ore:ingotCopper>, 1, <liquid:sulfuricacid> * 10, 
[<ore:ingotCopperRefined>.firstItem, <ore:dustSmallNickel>.firstItem, <ore:dustSmallSilver>.firstItem, <ore:dustSmallGold>.firstItem], 
[1.0, 0.4, 0.2, 0.1], 20, 10);

// 乙醇
Condenser.addRecipe(<forge:bucketfilled>.withTag({FluidName: "ethanol", Amount: 1000}), [<item:minecraft:sugar>, <item:minecraft:potato>], null, <item:minecraft:bucket>, <liquid:water> * 1000, 4800);

// 钢
AeroBlast.addRecipe("steel_charcoal", [<item:minecraft:iron_ore>, <item:minecraft:coal:1> * 4, <ore:dustMarble>.firstItem * 3], [<ore:ingotSteel>.firstItem * 2], 150, 1000);

AeroBlast.addRecipe("steel", [<item:minecraft:iron_ore>, <item:immersiveengineering:material:6>, <ore:dustMarble>.firstItem * 3], [<ore:ingotSteel>.firstItem * 2], 150, 1000);

// Dust Patch
addCrushRecipe(<ore:enderpearl>, <ore:dustEnder>, 1);
addCrushRecipe(<ore:coal>, <ore:dustCoal>, 1);
addCrushRecipe(<ore:charcoal>, <ore:dustCharcoal>, 1);
addCrushRecipe(<ore:itemPrecientCrystal>, <ore:itemPrecientPowder>, 1);
addCrushRecipe(<ore:itemVibrantCrystal>, <ore:itemVibrantPowder>, 1);

// 铬
addOreDresserRecipe(<ore:dustRedstone>, null, <ore:dustSmallChromium>.firstItem % 40, 4000, 180);

// 铟
addOreDresserRecipe(<ore:oreTin>, <ore:dustTin>.firstItem, <ore:dustIndium>.firstItem % 14, 4000, 180);

// 硅
furnace.remove(<item:appliedenergistics2:material:5>);
mods.mekanism.crusher.removeRecipe(<item:nuclearcraft:gem:6>);
mods.nuclearcraft.manufactory.removeRecipeWithOutput([<item:nuclearcraft:gem:6>]);
AeroBlast.addRecipe("raw_si_charcoal", [<item:contenttweaker:crystal_sand>, <item:minecraft:coal:1>], [<item:enderio:item_material:5>], 150, 80);
AeroBlast.addRecipe("raw_si", [<item:contenttweaker:crystal_sand> * 4, <item:immersiveengineering:material:6>], [<item:enderio:item_material:5> * 4], 150, 150);
addChlorinizerRecipe(250, [<ore:itemSilicon>, <ore:dustCoal>.firstItem * 2 | <ore:dustCharcoal>.firstItem * 2], <liquid:raw_sicl4> * 250, 12000, 300);
Refinery.addRecipe(<liquid:sicl4> * 200, <ore:dustCoal>.firstItem % 20, <liquid:raw_sicl4> * 250, 5000);
reaction.addRecipe(<ore:blockGlassHardened>, <liquid:sicl4> * 400, <gas:hydrogen> * 800, <item:contenttweaker:pure_si> * 2, <gas:hydrogenchloride> * 1600, 6000, 400);
