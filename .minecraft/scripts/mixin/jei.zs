#loader mixin
#sideonly client

import native.mezz.jei.api.recipe.IRecipeCategory;

#mixin {targets: "mezz.jei.recipes.RecipeRegistry"}
zenClass MixinRecipeCategoryComparator {
    #mixin Static
    #mixin ModifyVariable {method: "<init>", at: {value: "HEAD"}, ordinal: 0, argsOnly: true}
    function reorder(categories as [IRecipeCategory]) as [IRecipeCategory] {
        return scripts.jei.reorder.reorderCategories(categories);
    }
}
