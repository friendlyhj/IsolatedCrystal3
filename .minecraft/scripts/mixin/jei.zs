#loader mixin
#norun

import native.mezz.jei.api.recipe.IRecipeCategory;
import native.com.google.common.collect.ImmutableList;
import native.mezz.jei.ingredients.IngredientRegistry;
import native.mezz.jei.recipes.RecipeCategoryComparator;
import native.java.util.Comparator;
import native.java.util.ArrayList;
import mixin.CallbackInfo;
import mixin.CallbackInfoReturnable;

#mixin {targets: "mezz.jei.recipes.RecipeCategoryComparator"}
zenClass MixinRecipeCategoryComparator {
    #mixin Shadow
    #mixin Final
    #mixin Mutable
    var recipeCategories as ImmutableList;

    #mixin Inject {method: "<init>", at: {value: "RETURN"}}
    function reorderRecipeCategories(categories as [IRecipeCategory], ci as CallbackInfo) as void {
        val orders as string[] = [
            "Minecraft",
            "Had Enough Items",
            "advancedmortars",
            "inworldcrafting",
            "Botania",
            "Botania Tweaks",
            "crafttweaker",
            "Nature's Aura",
            "Just Enough Fluid Interactions",
            "Just Enough Fluid Behavior",
            "Tinkers' Antique",
            "Tinkers' Complement",
            "Tinker I/O",
            "Artisan Worktables",
            "Modular Machinery: Community Edition",
            "Thermal Expansion",
            "PneumaticCraft: Repressurized",
            "Immersive Engineering",
            "Factory Tech",
            "Flux Networks",
            "ThaumicJEI",
            "Thaumic Additions: Reconstructed",
            "Blood Magic: Alchemical Wizardry",
            "Astral Sorcery",
            "enderio",
            "enderiomachines",
            "Mekanism",
            "Actually Additions",
            "Applied Energistics 2",
            "calculator",
            "Calculator",
            "Emerging Technology",
            "nuclearcraft",
            "extrautils2",
            "compactmachines3",
            "embers",
            "Embers Unofficial Extended Life",
            "Soot",
            "draconicevolution"
        ];

        val categoriesReorder as [string][string]$orderly = {};
        for name in orders {
            categoriesReorder[name] = [];
        }
        categoriesReorder["Others"] = [];

        for category in categories {
            var modCategories as [string];
            if (orders has category.modName) {
                modCategories = categoriesReorder[category.modName];
            } else {
                modCategories = categoriesReorder["Others"];
            }
            modCategories.add(category.uid);
        }
        val reorderedCategories = [] as string[];
        for modName, reorderedCategories in categoriesReorder {
            reorderedCategories.addAll(reorderedCategories as string[]);
        }
        recipeCategories = ImmutableList.copyOf(reorderedCategories);
    }
}

#mixin {targets: "mezz.jei.startup.ModRegistry"}
zenClass MixinModRegistry {
    #mixin Inject {method: "createRecipeRegistry", at: {value: "HEAD"}}
    function reorderRecipeCategories(ingredientRegistry as IngredientRegistry, cir as CallbackInfoReturnable) as void {
        val recipeCategories = this0.recipeCategories as ArrayList;
        recipeCategories.sort(Comparator.comparing(function(c as IRecipeCategory) as string {return c.uid;}, RecipeCategoryComparator(recipeCategories)));
    }

    function getRecipeCategories() as [IRecipeCategory] {
        return this0.recipeCategories;
    }
}