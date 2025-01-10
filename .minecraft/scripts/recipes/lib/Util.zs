#priority 100
#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

function recipeTweak(shaped as bool, out as IItemStack, inputs as IIngredient[][]) as void {
    recipes.remove(out, true);
    if (shaped) {
        recipes.addShaped(out, inputs);
    } else {
        recipes.addShapeless(out, inputs[0]);
    }
}

function modItems(modid as string) as IIngredient {
    return <*>.only(function(item) {
        return item.definition.owner == modid;
    });
}