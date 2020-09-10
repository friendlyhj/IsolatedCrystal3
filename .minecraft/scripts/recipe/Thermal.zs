#ignoreBracketErrors
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemDefinition;
import scripts.grassUtils.RecipeUtils.recipeTweak;
import scripts.recipe.modularMachinery.Assembler;
import scripts.compatSkills.SkillLocker;
import scripts.compatSkills.Utils.getSkillArray;
import mods.rustic.CrushingTub;

// 树脂
CrushingTub.addRecipe(<fluid:resin> * 125, null, <item:minecraft:log:1>);

// 线圈
recipeTweak(true, <item:thermalfoundation:material:513> * 2, [
    [null, <ore:wireGold>, <ore:dustRedstone>],
    [<ore:wireGold>, <ore:dustRedstone>, <ore:wireGold>],
    [<ore:dustRedstone>, <ore:wireGold>, null]
]);

recipeTweak(true, <item:thermalfoundation:material:514> * 2, [
    [null, <ore:wireSilver>, <ore:dustRedstone>],
    [<ore:wireSilver>, <ore:dustRedstone>, <ore:wireSilver>],
    [<ore:dustRedstone>, <ore:wireSilver>, null]
]);

recipeTweak(true, <item:thermalfoundation:material:515> * 2, [
    [<ore:dustRedstone>, <ore:wireElectrum>, null],
    [<ore:wireElectrum>, <ore:dustRedstone>, <ore:wireElectrum>],
    [null, <ore:wireElectrum>, <ore:dustRedstone>]
]);

// 框架
recipes.remove(<item:thermalexpansion:frame:32767>);
Assembler.addRecipe("te_machine_frame", [<ore:plateSteel>, <ore:plateEnergeticTin>, <ore:blockGlass>, <ore:gearTin>, <ore:circuitRefined>], [4, 2, 4, 1, 4], [<item:thermalexpansion:frame>], 4000, 100, 288);
Assembler.addRecipe("te_device_frame", [<ore:plateSteel>, <ore:plateEnergeticTin>, <ore:blockGlass>, <ore:gearCopper>, <ore:circuitRefined>], [4, 2, 4, 1, 2], [<item:thermalexpansion:frame:64>], 4000, 100, 288);
Assembler.addRecipe("te_energy_frame", [<ore:plateSteel>, <ore:plateEnergeticTin>, <ore:blockGlass>, <ore:gearLead>, <ore:circuitRefined>], [4, 2, 4, 1, 4], [<item:thermalexpansion:frame:128>], 4000, 100, 288);

// 机器锁技能
val def as IItemDefinition = <item:thermalexpansion:machine>.definition;
for i in 0 .. 16 {
    var recipeName as string = "thermalexpansion:machine";
    if (i != 0) {
        recipeName ~= ("_" + i);
    }
    // 感应炉
    if (i == 3) {
        SkillLocker.lockItem(def.makeStack(i), getSkillArray("m7n6l5"));
        SkillLocker.lockRecipeWithStage(recipeName, getSkillArray("m7n6l5"));
    } else {
        SkillLocker.lockItem(def.makeStack(i), getSkillArray("m7n6"));
        SkillLocker.lockRecipeWithStage(recipeName, getSkillArray("m7n6"));
    }
}

// 设备锁技能
val def1 as IItemDefinition = <item:thermalexpansion:device>.definition;
for i in 0 .. 13 {
    var recipeName as string = "thermalexpansion:device";
    if (i != 0) {
        recipeName ~= ("_" + i);
    }
    SkillLocker.lockItem(def1.makeStack(i), getSkillArray("m7n6"));
    SkillLocker.lockRecipeWithStage(recipeName, getSkillArray("m7n6"));
}
