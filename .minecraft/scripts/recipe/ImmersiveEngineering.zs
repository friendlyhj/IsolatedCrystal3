import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.compatSkills.SkillLocker;
import scripts.grassUtils.RecipeUtils.createCrossWithCore;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.compatSkills.Utils.toAllSkill;
import scripts.recipe.modularMachinery.Assembler;
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
    [<immersiveengineering:material>, <ore:plankTreatedWood>, <immersiveengineering:material>],
    [<ore:plankTreatedWood>, <immersiveengineering:material>, <ore:plankTreatedWood>]])
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
    [<immersiveengineering:material:10>, <ore:ingotSteel>, <immersiveengineering:material:10>],
    [null, <immersiveengineering:material:10>, null]])
  .addTool(<ore:artisansFramingHammer>, 5)
  .addTool(<ore:artisansHandsaw>, 10)
  .addOutput(<immersiveengineering:wooden_device1>)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m5n3"))))
  .create();

SkillLocker.lockItem(<immersiveengineering:wooden_device1>, getSkillArray("m5n3"));
recipes.remove(<immersiveengineering:wooden_device1>);

// 风车
RecipeBuilder.get("carpenter")
  .setShaped([
    [<ore:plankTreatedWood>, <ore:plankTreatedWood>, null],
    [<ore:stickTreatedWood>, <ore:stickTreatedWood>, <ore:plankTreatedWood>],
    [<ore:stickTreatedWood>, <ore:stickTreatedWood>, null]])
  .addTool(<ore:artisansFramingHammer>, 5)
  .addTool(<ore:artisansHandsaw>, 10)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m5n3"))))
  .addOutput(<immersiveengineering:material:11>)
  .setExtraOutputOne(<thermalfoundation:material:800> * 2, 1.0)
.create();

SkillLocker.lockItem(<immersiveengineering:material:11>, getSkillArray("m5n3"));
recipes.remove(<immersiveengineering:material:11>);

// 动能发电机
RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:ingotSteel>, <enderio:item_alloy_ingot:4>, <ore:ingotSteel>],
    [<minecraft:piston>, <immersiveengineering:metal_decoration0>, <thermalfoundation:material:24>],
    [<ore:ingotSteel>, <enderio:item_alloy_ingot:4>, <ore:ingotSteel>]])
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
    [<ore:ingotInvar>, <thermalfoundation:material:514>, <ore:ingotInvar>],
    [<prodigytech:circuit_refined>, <immersiveengineering:metal_device1:2>, <prodigytech:circuit_refined>],
    [<ore:ingotInvar>, <enderio:item_basic_capacitor>, <ore:ingotInvar>]])
  .addOutput(<immersiveengineering:metal_decoration0:6>)
.create();

SkillLocker.lockItem(<immersiveengineering:metal_decoration0:6>, getSkillArray("m6n6"));
recipes.remove(<immersiveengineering:metal_decoration0:6>);

// 红石工程块
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateSteel>, <minecraft:redstone>, <ore:plateSteel>],
    [<minecraft:redstone>, null, <minecraft:redstone>],
    [<ore:plateSteel>, <minecraft:redstone>, <ore:plateSteel>]])
  .addTool(<artisanworktables:artisans_hammer_wood>, 10)
  .addTool(<contenttweaker:soldering_manasteel>, 2)
  .setFluid(<fluid:soldering> * 144)
  .addOutput(<immersiveengineering:metal_decoration0:3>)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m5i4"))))
.create();

SkillLocker.lockItem(<immersiveengineering:metal_decoration0:3>, getSkillArray("m5i4"));
recipes.remove(<immersiveengineering:metal_decoration0:3>);
Assembler.addRecipe("ie_redstone", [<ore:plateSteel>, <ore:dustRedstone>], [4, 4], [<item:immersiveengineering:metal_decoration0:3>], 2000, 100, 144);

// 轻型工程块
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateSteel>, <immersiveengineering:material:8>, <ore:plateSteel>],
    [<ore:plateCopper>, <ore:plateFerramic>, <ore:plateCopper>],
    [<ore:plateSteel>, <immersiveengineering:material:8>, <ore:plateSteel>]])
  .addTool(<artisanworktables:artisans_hammer_wood>, 10)
  .addTool(<contenttweaker:soldering_manasteel>, 2)
  .setFluid(<fluid:soldering> * 144)
  .addOutput(<immersiveengineering:metal_decoration0:4> * 2)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m5n5"))))
.create();

SkillLocker.lockItem(<immersiveengineering:metal_decoration0:4>, getSkillArray("m5n5"));
recipes.remove(<immersiveengineering:metal_decoration0:4>);
Assembler.addRecipe("ie_light", [<ore:plateSteel>, <ore:componentIron>, <ore:plateCopper>, <ore:plateFerramic>], [4, 2, 2, 1], [<item:immersiveengineering:metal_decoration0:4> * 2], 2000, 100, 144);

// 重型工程块
RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateSteel>, <immersiveengineering:material:9>, <ore:plateSteel>],
    [<ore:plateBronze>, <ore:plateFerramic>, <ore:plateBronze>],
    [<ore:plateSteel>, <immersiveengineering:material:9>, <ore:plateSteel>]])
  .setFluid(<fluid:soldering> * 144)
  .addTool(<artisanworktables:artisans_hammer_wood>, 10)
  .addTool(<contenttweaker:soldering_manasteel>, 2)
  .addOutput(<immersiveengineering:metal_decoration0:5> * 2)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m6n5"))))
.create();

SkillLocker.lockItem(<immersiveengineering:metal_decoration0:5>, getSkillArray("m6n5"));
recipes.remove(<immersiveengineering:metal_decoration0:5>);
Assembler.addRecipe("ie_hard", [<ore:plateSteel>, <ore:componentSteel>, <ore:plateBronze>, <ore:plateFerramic>], [4, 2, 2, 1], [<item:immersiveengineering:metal_decoration0:5> * 2], 2000, 100, 144);
