import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import scripts.recipe.modularMachinery.Precision;
import mods.botania.ElvenTrade;

val i as IItemStack = <item:contenttweaker:item_module>;
val c as IItemStack = <item:contenttweaker:crafting_module>;
val r as IItemStack = <item:contenttweaker:redstone_module>;
val n as IItemStack = <item:contenttweaker:network_module>;
val an as IItemStack = <item:contenttweaker:advanced_network_module>;
val w as IItemStack = <item:contenttweaker:write_module>;
val u as IItemStack = <item:contenttweaker:usb_module>;
val f as IItemStack = <item:teslacorelib:machine_case>;
val l as IItemStack = <item:contenttweaker:liquid_module>;
val o as IItemStack = <item:contenttweaker:world_module>;
val wire as IItemStack = <item:appliedenergistics2:part:56>;
val b as IItemStack = <item:appliedenergistics2:material:43>;
val d as IItemStack = <item:appliedenergistics2:material:44>;
val p as IItemStack = <item:appliedenergistics2:part:180>;

Precision.tweakRecipe("storage", [wire, b, d], <item:appliedenergistics2:part:220>, 32000, 400, 500);
Precision.tweakRecipe("interface_part", [wire, i, c, n, u], <item:appliedenergistics2:part:440>, 16000, 600, 100);
Precision.tweakRecipe("terminal", [p, i, c, n], <item:appliedenergistics2:part:380>, 8000, 400, 100);
Precision.tweakRecipe("crafting_terminal", [<item:appliedenergistics2:part:380>, <item:minecraft:crafting_table>], <item:appliedenergistics2:part:360>, 16000, 600, 100);
Precision.tweakRecipe("pattern_termial", [<item:appliedenergistics2:part:360>, w], <item:appliedenergistics2:part:340>, 16000, 600, 100);
Precision.tweakRecipe("interface_termial", [p, n, w], <item:appliedenergistics2:part:480>, 16000, 600, 100);
Precision.tweakRecipe("interface", [f, i, c, n, u], <item:appliedenergistics2:interface>, 16000, 600, 100);
Precision.tweakRecipe("sign", [wire, n, r], <item:appliedenergistics2:part:280>, 8000, 400, 100);
Precision.tweakRecipe("trigger", [wire, r], <item:appliedenergistics2:part:80>, 8000, 400, 100);
Precision.tweakRecipe("p2p", [wire, an], <item:appliedenergistics2:part:460>, 32000, 400, 500);
Precision.tweakRecipe("cpu", [f, i, c, <item:appliedenergistics2:material:24> * 4, <item:appliedenergistics2:material:23> * 4], <item:appliedenergistics2:crafting_unit>, 16000, 600, 100);
Precision.tweakRecipe("crafting_monitor", [f, n, c], <item:appliedenergistics2:crafting_monitor>, 16000, 400, 100);
Precision.tweakRecipe("input", [wire, d], <item:appliedenergistics2:part:240>, 8000, 400, 100);
Precision.tweakRecipe("output", [wire, b], <item:appliedenergistics2:part:260>, 8000, 400, 100);
Precision.tweakRecipe("driver", [f, i * 7, u * 4], <item:appliedenergistics2:drive>, 32000, 800, 500);
Precision.tweakRecipe("security", [<item:appliedenergistics2:chest>, an, <item:appliedenergistics2:material:37>, w], <item:appliedenergistics2:security_station>, 64000, 800, 1000);
Precision.tweakRecipe("storage_monitor", [p, i, n], <item:appliedenergistics2:part:400>, 8000, 400, 100);
Precision.tweakRecipe("exchange_monitor", [<item:appliedenergistics2:part:400>, b, d], <item:appliedenergistics2:part:420>, 8000, 400, 100);
Precision.tweakRecipe("fluid_terminal", [p, l, c, n], <item:appliedenergistics2:part:520>, 8000, 400, 100);
Precision.tweakRecipe("fluid_input", [wire, d, l], <item:appliedenergistics2:part:241>, 8000, 400, 100);
Precision.tweakRecipe("fluid_output", [wire, b, l], <item:appliedenergistics2:part:261>, 8000, 400, 100);
Precision.tweakRecipe("fluid_storage", [wire, b, d, l], <item:appliedenergistics2:part:221>, 32000, 400, 500);
Precision.tweakRecipe("formation", [wire, i, b, o], <item:appliedenergistics2:part:320>, 16000, 400, 100);
Precision.tweakRecipe("annihilation", [wire, i, d, o], <item:appliedenergistics2:part:300>, 16000, 400, 100);
Precision.tweakRecipe("fluid_formation", [wire, l, b, o], <item:appliedenergistics2:part:321>, 16000, 400, 100);
Precision.tweakRecipe("fluid_annihilation", [wire, l, d, o], <item:appliedenergistics2:part:302>, 16000, 400, 100);
Precision.tweakRecipe("me_chest", [f, <item:appliedenergistics2:part:380>, u], <item:appliedenergistics2:chest>, 16000, 400, 100);

// 奸商精灵
ElvenTrade.addRecipe([<item:appliedenergistics2:part:360>], [<item:botania:corporeaspark:1>, <ore:blockZorrasteel>, <ore:blockEnergeticTin>, <ore:circuitPerfect>, <ore:circuitPerfect>, <ore:circuitPerfect>]);
ElvenTrade.addRecipe([<item:appliedenergistics2:interface>], [<item:botania:corporeaspark>, <ore:blockManasteel>, <ore:blockManasteel>, <ore:ingotTerrasteel>, <ore:blockOsmium>, <ore:blockOsmium>, <ore:eternalLifeEssence>, <ore:eternalLifeEssence>]);
ElvenTrade.addRecipe([<item:appliedenergistics2:part:220>], [<item:botania:corporeaspark>, <ore:blockManasteel>, <ore:runeManaB>, <ore:runeEarthB>, <item:botania:manaresource:15>, <ore:eternalLifeEssence>]);
ElvenTrade.addRecipe([<item:appliedenergistics2:part:2> * 16], [<item:botania:corporeaspark>, <ore:blockGlass>, <ore:blockGlass>, <ore:blockQuartzBlack>, <ore:blockQuartzBlack>, <ore:blockQuartzBlack>, <ore:runeGreedB>]);
ElvenTrade.addRecipe([<item:appliedenergistics2:energy_acceptor>], [<item:botania:auraringgreater>, <ore:blockRedstone>, <item:immersiveengineering:metal_decoration0:6>]);
