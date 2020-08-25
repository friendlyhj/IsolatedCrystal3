#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.advancedmortars.Mortar;
import mods.thermalexpansion.Refinery;
import mods.mekanism.reaction;
import scripts.recipe.Util.allMortarTypes;
import scripts.recipe.Util.addCrushRecipe;
import scripts.recipe.extraUtilities.MachineRecipe.addChlorinizerRecipe;

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

// ti
addCrushRecipe(<item:contenttweaker:rutile>, <item:contenttweaker:rutile_dust>);
addChlorinizerRecipe(250, [<item:contenttweaker:rutile_dust>, <ore:dustCoal> * 2 | <ore:dustCharcoal> * 2], <liquid:raw_ticl4> * 250, 8000, 80);
Refinery.addRecipe(<liquid:ticl4> * 200, <ore:dustCoal>.firstItem % 20, <liquid:raw_ticl4> * 250, 5000);
reaction.addRecipe(<ore:plateCopper>, <liquid:ticl4> * 400, <gas:hydrogen> * 800, <ore:dustTitanium>.firstItem.withAmount(2), <gas:hydrogen> * 80, 6000, 150);
