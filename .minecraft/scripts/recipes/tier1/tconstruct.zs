#reloadable

import mods.tconstruct.Drying;
import mods.tconstruct.Casting;
import mods.tconstruct.Melting;

Drying.addRecipe(<tconstruct:materials>, <tconstruct:soil>, 1200);
Casting.addBasinRecipe(<minecraft:furnace>, <contenttweaker:blazing_spark>, <liquid:stone>, 576, true, 400);
Casting.addTableRecipe(<contenttweaker:earth_crystal>, <minecraft:flint>, <liquid:clay>, 2880, true, 400);
Melting.addRecipe(<liquid:blood> * 40, <ore:meatRaw>, 312);
Casting.removeTableRecipe(<tconstruct:cast_custom:4>);
Melting.removeRecipe(<liquid:gold> * 144, <minecraft:golden_rail>);
Melting.removeRecipe(<liquid:iron> * 144, <minecraft:detector_rail>);
Melting.removeRecipe(<liquid:iron> * 144, <minecraft:activator_rail>);
Melting.removeRecipe(<liquid:iron> * 54, <minecraft:rail>);
