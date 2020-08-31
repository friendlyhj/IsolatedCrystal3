#priority 80
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

static allMortarTypes as string[] = ["wood", "stone", "iron", "diamond", "emerald", "obsidian"];

static maxInt as int = 2147483647;

function addCrushRecipe(input as IIngredient, output as IIngredient) {
    mods.thermalexpansion.Pulverizer.addRecipe(output.items[0], input.items[0], 2400);
    mods.advancedmortars.Mortar.addRecipe(allMortarTypes, output.items[0], 8, [input]);
    mods.immersiveengineering.Crusher.addRecipe(output.items[0], input, 2048);
    if (input instanceof IItemStack) {
        val item as IItemStack = input;
        mods.prodigytech.rotarygrinder.addRecipe(item, output.items[0]);
    } else if (input instanceof IOreDictEntry) {
        val ore as IOreDictEntry = input;
        mods.prodigytech.rotarygrinder.addRecipe(ore, output.items[0]);
    }
    mods.actuallyadditions.Crusher.addRecipe(output.items[0], input.items[0]);
}