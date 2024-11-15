import mods.factorytech.Agitator;
import mods.factorytech.ElectricFurnace;

Agitator.addRecipe(<liquid:h2so4> * 50, null, <mekanism:salt>, <liquid:liquidhydrogenchloride> * 100, null);
ElectricFurnace.removeRecipe(<appliedenergistics2:material:5>);
Agitator.removeRecipe(null, <liquid:energite> * 200);
Agitator.addRecipe(<liquid:pyrotheum> * 100, <liquid:h2so4> * 100, <factorytech:intermediate:3>, <liquid:energite> * 200, null);

