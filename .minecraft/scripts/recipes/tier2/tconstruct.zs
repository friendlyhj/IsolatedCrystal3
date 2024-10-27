#reloadable

import mods.tconstruct.Alloy;
import mods.tconstruct.Casting;
import mods.tconstruct.Melting;

Casting.addTableRecipe(<thaumcraft:quicksilver>, null, <liquid:mercury>, 144, false, 20);
Melting.addRecipe(<liquid:mercury> * 144, <thaumcraft:quicksilver>, 312);
Alloy.addRecipe(<liquid:soldering> * 5, [<liquid:tin> * 3, <liquid:lead> * 2]);
Melting.addRecipe(<liquid:compressed_iron> * 144, <ore:ingotIronCompressed>, 624);
