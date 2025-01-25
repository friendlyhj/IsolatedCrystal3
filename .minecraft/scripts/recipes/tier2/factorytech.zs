import mods.factorytech.Agitator;
import mods.factorytech.ElectricFurnace;
import mods.factorytech.DrillGrinder;
import mods.factorytech.ScrapFurnace;

Agitator.addRecipe(<liquid:h2so4> * 50, null, <mekanism:salt>, <liquid:liquidhydrogenchloride> * 100, null);
Agitator.addRecipe(<liquid:h2so4> * 250, null, <mekanism:saltblock>, <liquid:liquidhydrogenchloride> * 400, null);
ElectricFurnace.removeRecipe(<appliedenergistics2:material:5>);
Agitator.removeRecipe(null, <liquid:energite> * 200);
Agitator.addRecipe(<liquid:pyrotheum> * 100, <liquid:h2so4> * 100, <factorytech:intermediate:3>, <liquid:energite> * 200, null);
DrillGrinder.addRecipe(<contenttweaker:sand_dust>, <minecraft:sand>, true);
ElectricFurnace.addRecipe(<appliedenergistics2:material:5>, <contenttweaker:sand_dust>, true);
ScrapFurnace.removeRecipe(<factorytech:ingot:2> * 3);
ScrapFurnace.addRecipe(<thermalfoundation:material:164> * 3, <factorytech:salvagepart:80>, true);
ScrapFurnace.addRecipe(<thermalfoundation:material:164> * 3, <factorytech:salvagepart:81>, true);
