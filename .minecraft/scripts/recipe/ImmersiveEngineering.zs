import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.compatSkills.SkillLocker;
import scripts.grassUtils.RecipeUtils.createCrossWithCore;
import scripts.compatSkills.Utils.getSkillArray;

// 铜线圈
SkillLocker.tweakLockedRecipe(true, <item:immersiveengineering:wirecoil> * 2, createCrossWithCore(<ore:stickTreatedWood>, null, <item:contenttweaker:varnished_copper_wire>), getSkillArray("n5t4"));

// 琥珀金线圈
SkillLocker.tweakLockedRecipe(true, <item:immersiveengineering:wirecoil:1> * 2, createCrossWithCore(<ore:stickTreatedWood>, null, <item:contenttweaker:varnished_electrum_wire>), getSkillArray("n5t4"));