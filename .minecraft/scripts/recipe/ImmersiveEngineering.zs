import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.compatSkills.SkillLocker;
import scripts.grassUtils.RecipeUtils.createCrossWithCore;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.compatSkills.Utils.toAllSkill;
import mods.immersiveengineering.MetalPress;
import mods.multiblockstages.IEMultiBlockStages;
import mods.artisanintegrations.requirement.Reskillable;
import mods.artisanworktables.builder.RecipeBuilder;
import mods.jei.JEI;

// 铜线圈
SkillLocker.tweakLockedRecipe(true, <item:immersiveengineering:wirecoil> * 2, createCrossWithCore(<ore:stickTreatedWood>, null, <item:contenttweaker:varnished_copper_wire>), getSkillArray("n5t4"));

// 琥珀金线圈
SkillLocker.tweakLockedRecipe(true, <item:immersiveengineering:wirecoil:1> * 2, createCrossWithCore(<ore:stickTreatedWood>, null, <item:contenttweaker:varnished_electrum_wire>), getSkillArray("n5t4"));

// ban 焦炉和高炉
IEMultiBlockStages.addStage("banned", "IE:CokeOven", "Banned");
IEMultiBlockStages.addStage("banned", "IE:BlastFurnace", "Banned");
IEMultiBlockStages.addStage("banned", "IE:BlastFurnaceAdvanced", "Banned");
JEI.hideCategory("ie.cokeoven");
JEI.hideCategory("ie.blastfurnace");
JEI.hideCategory("ie.blastfurnace.fuel");

// 铜线
recipes.remove(<item:immersiveengineering:material:20>);
recipes.addShapeless("tweaked_copper_wire", <item:immersiveengineering:material:20>, [<ore:plateCopperRefined>, <item:immersiveengineering:tool:1>]);
MetalPress.removeRecipe(<item:immersiveengineering:material:20>);
MetalPress.addRecipe(<item:immersiveengineering:material:20> * 2, <ore:plateCopperRefined>, <item:immersiveengineering:mold:4>, 2000);

// 水车
RecipeBuilder.get("carpenter")
  .setShaped([
    [null, <immersiveengineering:material>, null],
    [<immersiveengineering:material>, <immersiveengineering:treated_wood>, <immersiveengineering:material>],
    [<immersiveengineering:treated_wood>, <immersiveengineering:material>, <immersiveengineering:treated_wood>]])
  .addTool(<ore:artisansFramingHammer>, 5)
  .addTool(<ore:artisansHandsaw>, 10)
  .addOutput(<immersiveengineering:material:10>)
  .setExtraOutputOne(<thermalfoundation:material:800> * 2, 1.0)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m5n3"))))
  .create();

SkillLocker.lockItem(<immersiveengineering:material:10>, getSkillArray("m5n3"));
recipes.remove(<immersiveengineering:material:10>);

RecipeBuilder.get("carpenter")
  .setShaped([
    [null, <immersiveengineering:material:10>, null],
    [<immersiveengineering:material:10>, <thermalfoundation:material:160>, <immersiveengineering:material:10>],
    [null, <immersiveengineering:material:10>, null]])
  .addTool(<ore:artisansFramingHammer>, 5)
  .addTool(<ore:artisansHandsaw>, 10)
  .addOutput(<immersiveengineering:wooden_device1>)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m5n3"))))
  .create();

SkillLocker.lockItem(<immersiveengineering:wooden_device1>, getSkillArray("m5n3"));
recipes.remove(<immersiveengineering:wooden_device1>);

// 动能发电机
RecipeBuilder.get("engineer")
  .setShaped([
    [<thermalfoundation:material:160>, <enderio:item_alloy_ingot:4>, <thermalfoundation:material:160>],
    [<minecraft:piston>, <immersiveengineering:metal_decoration0>, <thermalfoundation:material:24>],
    [<thermalfoundation:material:160>, <enderio:item_alloy_ingot:4>, <thermalfoundation:material:160>]])
  .addTool(<ore:artisansDriver>, 10)
  .addTool(<ore:artisansSpanner>, 5)
  .addOutput(<immersiveengineering:metal_device1:2>)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m5n5"))))
.create();

SkillLocker.lockItem(<immersiveengineering:metal_device1:2>, getSkillArray("m5n5"));
recipes.remove(<immersiveengineering:metal_device1:2>);

// 发电机模块
RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:ingotSteel>, <thermalfoundation:material:514>, <ore:ingotSteel>],
    [<prodigytech:circuit_refined>, <immersiveengineering:metal_device1:2>, <prodigytech:circuit_refined>],
    [<ore:ingotSteel>, <prodigytech:circuit_refined>, <ore:ingotSteel>]])
  .addOutput(<immersiveengineering:metal_decoration0:6>)
.create();

SkillLocker.lockItem(<immersiveengineering:metal_decoration0:6>, getSkillArray("m6n6"));
recipes.remove(<immersiveengineering:metal_decoration0:6>);
