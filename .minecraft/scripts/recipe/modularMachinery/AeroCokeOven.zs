#priority 70
import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import scripts.recipe.Util.maxInt;

static machineName as string = "aero_coke_oven";

function addRecipe(name as string, input as IItemStack, output as IItemStack, fluid as ILiquidStack, air as int, time as int) {
    RecipeBuilder.newBuilder(machineName ~ name, machineName , time)
    .addItemInput(input)
    .addItemOutput(output)
    .addFluidOutput(fluid)
    .addHotAirInput(air, maxInt, air)
    .addHotAirOutput(air, maxInt, air)
    .build();
}

function addRecipeWithOre(name as string, input as IOreDictEntry, inputAmount as int, output as IItemStack, fluid as ILiquidStack, air as int, time as int) {
    RecipeBuilder.newBuilder(machineName ~ name, machineName , time)
    .addItemInput(input, inputAmount)
    .addItemOutput(output)
    .addFluidOutput(fluid)
    .addHotAirInput(air, maxInt, air)
    .addHotAirOutput(air, maxInt, air)
    .build();
}