import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.grassUtils.RecipeUtils.recipeTweak;
import mods.rustic.CrushingTub;

// 树脂
CrushingTub.addRecipe(<fluid:resin> * 125, null, <item:minecraft:log:1>);

// 线圈
recipeTweak(true, <item:thermalfoundation:material:513> * 2, [
    [null, <ore:wireGold>, <ore:dustRedstone>],
    [<ore:wireGold>, <ore:dustRedstone>, <ore:wireGold>],
    [<ore:dustRedstone>, <ore:wireGold>, null]
]);

recipeTweak(true, <item:thermalfoundation:material:514> * 2, [
    [null, <ore:wireSilver>, <ore:dustRedstone>],
    [<ore:wireSilver>, <ore:dustRedstone>, <ore:wireSilver>],
    [<ore:dustRedstone>, <ore:wireSilver>, null]
]);

recipeTweak(true, <item:thermalfoundation:material:515> * 2, [
    [<ore:dustRedstone>, <ore:wireElectrum>, null],
    [<ore:wireElectrum>, <ore:dustRedstone>, <ore:wireElectrum>],
    [null, <ore:wireElectrum>, <ore:dustRedstone>]
]);
