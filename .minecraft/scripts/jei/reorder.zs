#loader mixin
#priority 1000

import native.mezz.jei.api.recipe.IRecipeCategory;

static orders as string[] = [
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

function reorderCategories(categories as [IRecipeCategory]) as [IRecipeCategory] {
    val categoriesReorder as [IRecipeCategory][string]$orderly = {};
    for name in orders {
        categoriesReorder[name] = [];
    }
    categoriesReorder["Others"] = [];
    for category in categories {
        var modCategories as [IRecipeCategory];
        if (orders has category.modName) {
            modCategories = categoriesReorder[category.modName];
        } else {
            modCategories = categoriesReorder["Others"];
        }
        modCategories.add(category);
    }
    val reorderedCategories = [] as [IRecipeCategory];
    for modName, modCategories in categoriesReorder {
        reorderedCategories.addAll(modCategories);
    }
    return reorderedCategories;
}
