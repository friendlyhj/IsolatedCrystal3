#priority 70
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

static machineName as string = "precision_assembler";

function addRecipe(name as string, input as IItemStack[], out as IItemStack, mana as int, energy as int, time as int) {
    val a as RecipePrimer = RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName , time)
    .addEnergyPerTickInput(energy)
    .addManaInput(mana);
    for b in input {
        a.addItemInput(b);
    }
    a.addItemOutput(out).build();
}

function tweakRecipe(name as string, item as IItemStack[], out as IItemStack, mana as int, energy as int, time as int) {
    recipes.remove(out);
    addRecipe(name, item, out, mana, energy, time);
}
