#priority 80
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

static chlorinizer as IMachine = IMachineRegistry.getMachine("crafttweaker:chlorinizer");
static oreDresser as IMachine = IMachineRegistry.getMachine("electrolytic_ore_dresser");

function addChlorinizerRecipe(clAmount as int, items as IIngredient[], liquid as IIngredient, energy as int, time as int) {
    chlorinizer.addRecipe(
        {item: items[0], carbon: items[1], cl: <liquid:liquidchlorine> * clAmount},
        {output: liquid},
        energy,
        time
    );
}

function addOreDresserRecipe(input as IIngredient, dust as IItemStack, output as WeightedItemStack, energy as int, time as int) {
    if (!isNull(dust)) {
        oreDresser.addRecipe(
            {item: input},
            {dust: dust, output: output},
            energy,
            time
        );
    } else {
        oreDresser.addRecipe(
            {item: input},
            {output: output},
            energy,
            time
        );
    }
}