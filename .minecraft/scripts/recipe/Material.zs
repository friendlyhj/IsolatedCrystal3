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
import scripts.recipe.modularMachinery.AeroCokeOven;
import scripts.recipe.modularMachinery.ElectrolyticRefiner;

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

recipes.remove(<ore:dustSignalum>.firstItem);
recipes.remove(<ore:dustEnderium>.firstItem);
recipes.remove(<ore:dustLumium>.firstItem);

// IE 工程师锤砸板
recipes.removeByRegex("^immersiveengineering:material/plate_.*");

// ti
addCrushRecipe(<item:contenttweaker:rutile>, <item:contenttweaker:rutile_dust>);
addChlorinizerRecipe(250, [<item:contenttweaker:rutile_dust>, <ore:dustCoal> | <ore:dustCharcoal>], <liquid:raw_ticl4> * 250, 12000, 300);
Refinery.addRecipe(<liquid:ticl4> * 200, <ore:dustCoal>.firstItem % 20, <liquid:raw_ticl4> * 250, 5000);
reaction.addRecipe(<ore:plateCopper>, <liquid:ticl4> * 400, <gas:hydrogen> * 800, <ore:dustTitanium>.firstItem.withAmount(2), <gas:hydrogenchloride> * 1600, 6000, 400);

// coke
AeroCokeOven.addRecipe("coke", <item:minecraft:coal>, <item:immersiveengineering:material:6>, <fluid:creosote> * 250, 150, 400);
AeroCokeOven.addRecipeWithOre("methanol", <ore:logWood>, 1, <item:minecraft:coal:1>, <fluid:methanol> * 125, 150, 400);

// 醋
Condenser.addRecipe(<forge:bucketfilled>.withTag({FluidName: "vinegar", Amount: 1000}), [<item:rustic:chamomile>], null, <item:minecraft:bucket>, <liquid:hootch> * 1000, 4800);

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
