#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.advancedmortars.Mortar;
import scripts.recipe.Mortar.allMortarTypes;

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
