#priority 70
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import scripts.recipe.Util.maxInt;

static machineName as string = "aero_blast";

function addRecipe(name as string, input as IItemStack[], output as IItemStack[], air as int, time as int) {
    val a as RecipePrimer = RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName , time)
    // min, max, arg, but the document is arg, min, max
    // when the PR is merged and mod is released, change it to arg, min, max
    .addHotAirInput(air, maxInt, air)
    .addHotAirOutput(air * 8 / 10, maxInt, air * 8 / 10);
    for i in input {
        a.addItemInput(i);
    }
    for i in output {
        a.addItemOutput(i);
    }
    a.build();

    val b as RecipePrimer = RecipeBuilder.newBuilder(machineName ~ "_" ~ name ~ "_b", machineName , max(0.6 * time, 1))
    .addHotAirInput(1.6 * air, maxInt, 1.6 * air)
    .addHotAirOutput(1.28 * air, maxInt, 1.28 * air);
    for i in input {
        b.addItemInput(i);
    }
    for i in output {
        b.addItemOutput(i);
    }
    b.build();
}