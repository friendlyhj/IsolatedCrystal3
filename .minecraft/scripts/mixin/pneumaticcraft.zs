#loader mixin

import native.me.desht.pneumaticcraft.api.recipe.IPneumaticRecipeRegistry;
import native.net.minecraft.item.ItemStack;
import native.me.desht.pneumaticcraft.api.recipe.ItemIngredient;

#mixin {targets: "me.desht.pneumaticcraft.common.recipes.CraftingRegistrator"}
zenClass MixinCraftingRegistrator {
    #mixin Static
    #mixin Redirect{method: "addPressureChamberRecipes", at: {value: "INVOKE", target: "me/desht/pneumaticcraft/api/recipe/IPneumaticRecipeRegistry.registerPressureChamberRecipe([Lme/desht/pneumaticcraft/api/recipe/ItemIngredient;F[Lnet/minecraft/item/ItemStack;)V", ordinal: 5}}
    function removeEtchingAcidRecipe(registry as IPneumaticRecipeRegistry, ingredients as ItemIngredient[], pressure as float, outputs as ItemStack[]) as void {
        // no-op
    }
}