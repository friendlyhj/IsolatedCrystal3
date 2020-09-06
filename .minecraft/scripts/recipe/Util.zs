#priority 80
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.artisanworktables.builder.RecipeBuilder;
import mods.artisanintegrations.requirement.Reskillable;
import scripts.compatSkills.Utils.toAllSkill;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.compatSkills.SkillLocker;

static allMortarTypes as string[] = ["wood", "stone", "iron", "diamond", "emerald", "obsidian"];

static maxInt as int = 2147483647;

function addCrushRecipe(input as IIngredient, output as IIngredient, outputAmount as int) {
    mods.thermalexpansion.Pulverizer.addRecipe(output.items[0] * outputAmount, input.items[0], 2400);
    mods.advancedmortars.Mortar.addRecipe(allMortarTypes, output.items[0] * outputAmount, 8, [input]);
    mods.immersiveengineering.Crusher.addRecipe(output.items[0] * outputAmount, input, 2048);
    if (input instanceof IItemStack) {
        val item as IItemStack = input;
        mods.prodigytech.rotarygrinder.addRecipe(item, output.items[0] * outputAmount);
    } else if (input instanceof IOreDictEntry) {
        val ore as IOreDictEntry = input;
        mods.prodigytech.rotarygrinder.addRecipe(ore, output.items[0] * outputAmount);
    }
    mods.actuallyadditions.Crusher.addRecipe(output.items[0] * outputAmount, input.items[0]);
}

function setBluePrintRecipe(inputs as IIngredient[], out as IItemStack, skillArray as string) {
    RecipeBuilder.get("designer")
    .setShapeless(inputs)
    .addTool(<ore:artisansPencil>, 20)
    .addTool(<ore:artisansTSquare>, 20)
    .addOutput(out)
    .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray(skillArray))))
    .create();

    SkillLocker.lockItem(out, getSkillArray(skillArray));
}