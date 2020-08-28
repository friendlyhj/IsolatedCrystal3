import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

recipes.addShapeless("soldering_worktable", <volumetricflask:volumetric_flask_144>.withTag({Fluid: {FluidName: "soldering", Amount: 144}}),
[<volumetricflask:volumetric_flask_144>, <ore:ingotSoldering>, <item:contenttweaker:soldering_manasteel>.transformDamage(3)]);

recipes.addShapeless("fxxk_ender_air", <item:minecraft:glass_bottle>, [<item:botania:manaresource:15>]);