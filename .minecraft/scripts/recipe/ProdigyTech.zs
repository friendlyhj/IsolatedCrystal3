import mods.jei.JEI;
import scripts.compatSkills.SkillLocker;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.grassUtils.RecipeUtils.createSurround;
import scripts.compatSkills.Utils.toAllSkill;
import mods.artisanintegrations.requirement.Reskillable;
import mods.artisanworktables.builder.RecipeBuilder;

// 隐藏焚化炉 JEI
JEI.hideCategory("ptincinerator");

// 爆炸熔炉
SkillLocker.tweakLockedRecipe(true, <item:prodigytech:explosion_furnace>, createSurround(<ore:bricksStone>, <ore:obsidian>), getSkillArray("m2"));

// 旋转粉碎机
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateFerramic>, <ore:plateFerramic>, <ore:plateFerramic>],
    [<minecraft:flint>, <prodigytech:ferramic_gear>, <minecraft:flint>],
    [<ore:plateFerramic>, <ore:plateFerramic>, <ore:plateFerramic>]])
  .addTool(<contenttweaker:soldering_manasteel>, 1)
  .setFluid(<liquid:soldering> * 144)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3e4"))))
  .addOutput(<prodigytech:rotary_grinder>)
.create();
recipes.remove(<prodigytech:rotary_grinder>);
SkillLocker.lockItem(<prodigytech:rotary_grinder>, getSkillArray("m3e4"));

// 烘烤炉
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateFerramic>, <minecraft:iron_bars>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <minecraft:iron_trapdoor>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <minecraft:iron_bars>, <ore:plateFerramic>]])
  .addTool(<contenttweaker:soldering_manasteel>, 1)
  .setFluid(<liquid:soldering> * 144)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3e4"))))
  .addOutput(<prodigytech:blower_furnace>)
.create();
recipes.remove(<item:prodigytech:blower_furnace>);
SkillLocker.lockItem(<item:prodigytech:blower_furnace>, getSkillArray("m3e4"));
