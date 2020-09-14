import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.recipe.extraUtilities.MachineRecipe.addPolyRecipe;

furnace.remove(<industrialforegoing:plastic>);

addPolyRecipe(<fluid:ethene> * 250, <item:industrialforegoing:plastic>, 6000, 240);
addPolyRecipe(<fluid:liquidethene> * 250, <item:industrialforegoing:plastic>, 6000, 240);
