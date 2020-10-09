import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import scripts.recipe.modularMachinery.Precision;

val i as IItemStack = <item:contenttweaker:item_module>;
val c as IItemStack = <item:contenttweaker:crafting_module>;
val r as IItemStack = <item:contenttweaker:redstone_module>;
val n as IItemStack = <item:contenttweaker:network_module>;
val an as IItemStack = <item:contenttweaker:advanced_network_module>;
val w as IItemStack = <item:contenttweaker:write_module>;
val u as IItemStack = <item:contenttweaker:usb_module>;
val f as IItemStack = <item:teslacorelib:machine_case>;
val wire as IItemStack = <item:appliedenergistics2:part:56>;
val b as IItemStack = <item:appliedenergistics2:material:43>;
val d as IItemStack = <item:appliedenergistics2:material:44>;

Precision.tweakRecipe("storage", [wire, b, d], <item:appliedenergistics2:part:220>, 5000, 250, 100);
Precision.tweakRecipe("interface_part", [wire, i, c, n, u], <item:appliedenergistics2:part:440>, 10000, 400, 100);