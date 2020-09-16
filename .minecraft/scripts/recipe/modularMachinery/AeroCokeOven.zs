#priority 70
import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import scripts.recipe.Util.maxInt;

static machineName as string = "aero_coke_oven";

function addRecipe(name as string, input as IItemStack, output as IItemStack, fluid as ILiquidStack, air as int, time as int) {
    RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName , time)
    .addItemInput(input)
    .addItemOutput(output)
    .addFluidOutput(fluid)
    // min, max, arg, but the document is arg, min, max
    // when the PR is merged and mod is released, change it to arg, min, max
    .addHotAirInput(air, 1.6 * air, air)
    .addHotAirOutput(air * 8 / 10, maxInt, air * 8 / 10)
    .build();

    RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName , max(0.6 * time, 1))
    .addItemInput(input)
    .addItemOutput(output)
    .addFluidOutput(fluid)
    .addHotAirInput(1.6 * air, maxInt, 1.6 * air)
    .addHotAirOutput(1.28 * air, maxInt, 1.28 * air)
    .build();
}

function addRecipeWithOre(name as string, input as IOreDictEntry, inputAmount as int, output as IItemStack, fluid as ILiquidStack, air as int, time as int) {
    RecipeBuilder.newBuilder(machineName ~ name, machineName , time)
    .addItemInput(input, inputAmount)
    .addItemOutput(output)
    .addFluidOutput(fluid)
    .addHotAirInput(air, maxInt, air)
    .addHotAirOutput(air * 8 / 10, maxInt, air * 8 / 10)
    .build();

    RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName , max(0.6 * time, 1))
    .addItemInput(input, inputAmount)
    .addItemOutput(output)
    .addFluidOutput(fluid)
    .addHotAirInput(1.6 * air, maxInt, 1.6 * air)
    .addHotAirOutput(1.28 * air, maxInt, 1.28 * air)
    .build();
}