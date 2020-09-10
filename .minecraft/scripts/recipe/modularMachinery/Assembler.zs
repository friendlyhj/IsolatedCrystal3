#priority 70
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

static machineName as string = "assembler";

function addRecipe(name as string, input as IOreDictEntry[], inputAmount as int[], output as IItemStack[], energy as int, time as int, soldering as int) {
    val a as RecipePrimer = RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName , time)
    .addEnergyPerTickInput(energy)
    .addFluidInput(<liquid:soldering> * soldering);
    for i, b in input {
        a.addItemInput(b, inputAmount[i]);
    }
    for i in output {
        a.addItemOutput(i);
    }
    a.build();
}