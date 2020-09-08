import mods.jei.JEI;
import scripts.compatSkills.SkillLocker;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.grassUtils.RecipeUtils.createSurround;
import scripts.compatSkills.Utils.toAllSkill;
import mods.artisanintegrations.requirement.Reskillable;
import mods.artisanworktables.builder.RecipeBuilder;

// ban 基础的气热炉
JEI.removeAndHide(<prodigytech:magmatic_aeroheater>);
JEI.removeAndHide(<prodigytech:solid_fuel_aeroheater>);

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
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3n4"))))
  .addOutput(<prodigytech:rotary_grinder>)
.create();
recipes.remove(<prodigytech:rotary_grinder>);
SkillLocker.lockItem(<prodigytech:rotary_grinder>, getSkillArray("m3n4"));

// 烘烤炉
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateFerramic>, <minecraft:iron_bars>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <minecraft:iron_trapdoor>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <minecraft:iron_bars>, <ore:plateFerramic>]])
  .addTool(<contenttweaker:soldering_manasteel>, 1)
  .setFluid(<liquid:soldering> * 144)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3n4"))))
  .addOutput(<prodigytech:blower_furnace>)
.create();
recipes.remove(<item:prodigytech:blower_furnace>);
SkillLocker.lockItem(<item:prodigytech:blower_furnace>, getSkillArray("m3n4"));

// 热力锯木机
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateFerramic>, <prodigytech:ferramic_gear>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <ore:plateFerramic>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <minecraft:flint>, <ore:plateFerramic>]])
  .addTool(<contenttweaker:soldering_manasteel>, 1)
  .addOutput(<prodigytech:heat_sawmill>)
  .setFluid(<liquid:soldering> * 144)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3n4"))))
.create();
recipes.remove(<item:prodigytech:heat_sawmill>);
SkillLocker.lockItem(<item:prodigytech:heat_sawmill>, getSkillArray("m3n4"));

// 空气管道
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateFerramic>, null, <ore:plateFerramic>],
    [<ore:plateFerramic>, null, <ore:plateFerramic>],
    [<ore:plateFerramic>, null, <ore:plateFerramic>]])
  .addOutput(<prodigytech:air_funnel> * 4)
  .setFluid(<liquid:soldering> * 144)
  .addTool(<contenttweaker:soldering_manasteel>, 1)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3n4t2"))))
.create();
recipes.remove(<prodigytech:air_funnel>);
SkillLocker.lockItem(<prodigytech:air_funnel>, getSkillArray("m3n4t2"));

// 焊机
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateFerramic>, <botania:manaresource:7>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <contenttweaker:soldering_manasteel>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <botania:manaresource:7>, <ore:plateFerramic>]])
  .addOutput(<prodigytech:solderer>)
  .setFluid(<liquid:soldering> * 144)
  .addTool(<contenttweaker:soldering_manasteel>, 1)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3n4"))))
.create();
recipes.remove(<prodigytech:solderer>);
SkillLocker.lockItem(<prodigytech:solderer>, getSkillArray("m3n4"));

// 磁力重构机
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateFerramic>, <ore:blockIron>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <ore:ingotElvenCopper>, <ore:plateFerramic>],
    [<ore:plateFerramic>, <ore:blockIron>, <ore:plateFerramic>]])
  .addOutput(<prodigytech:magnetic_reassembler>)
  .setFluid(<liquid:soldering> * 144)
  .addTool(<contenttweaker:soldering_manasteel>, 1)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3n4l5"))))
.create();
recipes.remove(<prodigytech:magnetic_reassembler>);
SkillLocker.lockItem(<prodigytech:magnetic_reassembler>, getSkillArray("m3n4l5"));

// 矿石精炼机
RecipeBuilder.get("engineer")
  .setShaped([
    [<botania:manaresource:7>, <prodigytech:circuit_refined>, <botania:manaresource:7>],
    [<prodigytech:circuit_refined>, <prodigytech:rotary_grinder>, <prodigytech:circuit_refined>],
    [<botania:manaresource:7>, <prodigytech:circuit_refined>, <botania:manaresource:7>]])
  .addOutput(<prodigytech:ore_refinery>)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m3n4l4"))))
.create();
recipes.remove(<prodigytech:ore_refinery>);
SkillLocker.lockItem(<prodigytech:ore_refinery>, getSkillArray("m3n4l4"));

//