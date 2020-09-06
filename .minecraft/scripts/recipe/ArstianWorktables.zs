import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.compatSkills.SkillLocker;
import scripts.grassUtils.RecipeUtils.createSurround;
import mods.jei.JEI;

val design as IItemStack = <item:artisanworktables:design_pattern>;

// 铁匠工作台
SkillLocker.tweakLockedRecipe(true, <item:artisanworktables:worktable:3>, [
    [<ore:ingotIron>, <item:immersiveengineering:tool>, <ore:ingotIron>],
    [null, <ore:blockIron>, null],
    [<ore:livingwood>, <ore:livingwood>, <ore:livingwood>]
], getSkillArray("m2"));

SkillLocker.tweakLockedRecipe(false, <item:artisanworktables:workstation:3>, [
    [<item:artisanworktables:worktable:3>, <item:minecraft:chest>, <item:minecraft:anvil>]
], getSkillArray("m2"));

JEI.removeAndHide(<artisanworktables:artisans_hammer_iron>);

// 木匠工作台
recipes.addShaped(<item:artisanworktables:workstation:1>, [
    [<ore:plankWood>, <ore:logWood>, <ore:plankWood>],
    [null, <ore:plankTreatedWood>, null],
    [<ore:plankTreatedWood>, <item:minecraft:chest>, <ore:plankTreatedWood>]
]);

// 设计师工作台
recipes.addShaped(<item:artisanworktables:workstation:12>, [
   [design, design, design],
   [<ore:workbench>, <ore:manaString>, <ore:workbench>],
   [<ore:livingwood>, <item:minecraft:chest>, <ore:livingwood>] 
]);

// 空白设计图纸
recipes.addShaped("aw_design_pattern", design * 8, createSurround(<ore:dyeBlue>, <ore:paper>));
