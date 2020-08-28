#priority 0
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.grassUtils.RecipeUtils.recipeTweak;
import scripts.grassUtils.RecipeUtils.createCrossWithCore;

recipeTweak(true, <item:modularmachinery:blockcontroller>, [
    [<ore:plateInvar>, <ore:blockRedstone>, <ore:plateInvar>],
    [<ore:plateGold>, <ore:casingFerramic>, <ore:plateGold>],
    [<ore:plateInvar>, <ore:blockRedstone>, <ore:plateInvar>]
]);

recipeTweak(true, <item:modulardiversity:blockmanainputhatch>, createCrossWithCore(<ore:casingFerramic>, <ore:livingrock>, <ore:ingotManasteel>));
recipeTweak(true, <item:modulardiversity:blockmanaoutputhatch>, [[<item:modulardiversity:blockmanainputhatch>]]);
recipes.addShaped("manahatch_transform", <item:modulardiversity:blockmanainputhatch>, [[<item:modulardiversity:blockmanaoutputhatch>]]);