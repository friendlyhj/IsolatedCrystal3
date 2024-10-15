#reloadable

import mods.inworldcrafting.FireCrafting;
import mods.inworldcrafting.FluidToItem;

FireCrafting.addRecipe(<contenttweaker:blazing_spark>, <minecraft:fire_charge>, 100);
FluidToItem.transform(<minecraft:clay_ball>, <liquid:water>, [<contenttweaker:sand_dust>], false);
FluidToItem.transform(<contenttweaker:heated_crystal>, <liquid:lava>, [<contenttweaker:blazing_spark> * 24, <minecraft:gunpowder> * 8], false);
