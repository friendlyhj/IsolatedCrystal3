import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.compatSkills.SkillLocker;
import scripts.grassUtils.RecipeUtils.createCrossWithCore;
import scripts.compatSkills.Utils.getSkillArray;
import mods.immersiveengineering.MetalPress;
import mods.multiblockstages.IEMultiBlockStages;
import mods.jei.JEI;

// 铜线圈
SkillLocker.tweakLockedRecipe(true, <item:immersiveengineering:wirecoil> * 2, createCrossWithCore(<ore:stickTreatedWood>, null, <item:contenttweaker:varnished_copper_wire>), getSkillArray("n5t4"));

// 琥珀金线圈
SkillLocker.tweakLockedRecipe(true, <item:immersiveengineering:wirecoil:1> * 2, createCrossWithCore(<ore:stickTreatedWood>, null, <item:contenttweaker:varnished_electrum_wire>), getSkillArray("n5t4"));

// ban 焦炉
IEMultiBlockStages.addStage("banned", "IE:CokeOven", "Banned");
JEI.hideCategory("ie.cokeoven");

// 铜线
recipes.remove(<item:immersiveengineering:material:20>);
recipes.addShapeless("tweaked_copper_wire", <item:immersiveengineering:material:20>, [<ore:plateCopperRefined>, <item:immersiveengineering:tool:1>]);
MetalPress.removeRecipe(<item:immersiveengineering:material:20>);
MetalPress.addRecipe(<item:immersiveengineering:material:20> * 2, <ore:plateCopperRefined>, <item:immersiveengineering:mold:4>, 2000);
