import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.compatSkills.SkillLocker;

// 铁匠工作台
SkillLocker.tweakLockedRecipe(true, <item:artisanworktables:worktable:3>, [
    [<ore:ingotIron>, <item:immersiveengineering:tool>, <ore:ingotIron>],
    [null, <ore:blockIron>, null],
    [<ore:livingwood>, <ore:livingwood>, <ore:livingwood>]
], getSkillArray("m2"));

SkillLocker.tweakLockedRecipe(false, <item:artisanworktables:workstation:3>, [
    [<item:artisanworktables:worktable:3>, <item:minecraft:chest>, <item:minecraft:anvil>]
], getSkillArray("m2"));