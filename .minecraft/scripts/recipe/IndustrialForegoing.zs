import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.grassUtils.RecipeUtils.createSurround;
import scripts.recipe.extraUtilities.MachineRecipe.addPolyRecipe;
import mods.artisanworktables.builder.RecipeBuilder;

furnace.remove(<industrialforegoing:plastic>);

addPolyRecipe(<fluid:ethene> * 250, <item:industrialforegoing:plastic>, 6000, 240);
addPolyRecipe(<fluid:liquidethene> * 250, <item:industrialforegoing:plastic>, 6000, 240);

// 机器框架
// 其实这个已经不用来合成 IF 的，改用来合成 AE 的了
recipes.remove(<item:teslacorelib:machine_case>);

RecipeBuilder.get("engineer")
  .setShaped(createSurround(<item:appliedenergistics2:smooth_sky_stone_block>, <ore:plateTitanium>))
  .addTool(<ore:artisansDriver>, 10)
  .addTool(<ore:artisansSpanner>, 5)
  .addOutput(<item:teslacorelib:machine_case>)
.create();