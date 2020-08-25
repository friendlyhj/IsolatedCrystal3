#priority 80
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

static chlorinizer as IMachine = IMachineRegistry.getMachine("crafttweaker:chlorinizer");

function addChlorinizerRecipe(clAmount as int, items as IIngredient[], liquid as IIngredient, energy as int, time as int) {
    chlorinizer.addRecipe(
        {item: items[0], carbon: items[1], cl: <liquid:liquidchlorine> * clAmount},
        {output: liquid},
        energy,
        time
    );
}