#priority 70
import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

static machineName as string = "electrolytic_refiner";

function addRecipe(name as string, iteminput as IOreDictEntry, amount as int, liquid as ILiquidStack, itemoutput as IItemStack[], chance as float[], energyPerTick as int, time as int){
	var recipe = RecipeBuilder.newBuilder(machineName ~ "_" ~ name, machineName, time)
	.addEnergyPerTickInput(energyPerTick)
	.addItemInput(iteminput, amount)
	.addFluidInput(liquid);
	for i in 0 .. (itemoutput.length) {
	    recipe.addItemOutput(itemoutput[i]).setChance(chance[i]);
	}
	recipe.build();
}