#priority 199
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;

function addChlorinizerRecipe(input as IIngredient, clAmount as int, output as ILiquidStack, energy as int, time as int) {
    val recipe as AssemblyRecipe = AssemblyRecipe.create(function(container) {
        container.addFluidOutput("output", output);
    }).requireItem("input", input)
    .requireFluid("cl", <liquid:liquidchlorine> * clAmount)
    .requireEnergy("energy", energy)
    .requireDuration("time", time);
    <assembly:chlorinizer>.addRecipe(recipe);
    <assembly:chlorinizer>.addJEIRecipe(recipe);
}
