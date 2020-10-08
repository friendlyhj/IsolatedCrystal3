#priority 70
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

static machineName as string = "programmer";

function addRecipeWithOre(name as string, input as IOreDictEntry[], inputAmount as int[], output as IItemStack[], energy as int, time as int, glowstone as int) {
    val a as RecipePrimer = RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName , time)
    .addEnergyPerTickInput(energy);
    if (glowstone != 0) {
        a.addFluidInput(<fluid:glowstone> * glowstone);
    }
    for i, b in input {
        a.addItemInput(b, inputAmount[i]);
    }
    for i in output {
        a.addItemOutput(i);
    }
    a.build();
}

function addRecipe(name as string, input as IItemStack[], output as IItemStack[], energy as int, time as int, glowstone as int) {
    val a as RecipePrimer = RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName , time)
    .addEnergyPerTickInput(energy);
    if (glowstone != 0) {
        a.addFluidInput(<fluid:glowstone> * glowstone);
    }
    for b in input {
        a.addItemInput(b);
    }
    for i in output {
        a.addItemOutput(i);
    }
    a.build();
}