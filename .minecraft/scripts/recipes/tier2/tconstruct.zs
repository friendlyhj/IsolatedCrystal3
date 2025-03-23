#reloadable

import mods.tconstruct.Alloy;
import mods.tconstruct.Casting;
import mods.tconstruct.Melting;

Casting.addTableRecipe(<thaumcraft:quicksilver>, null, <liquid:mercury>, 144, false, 20);
Melting.addRecipe(<liquid:mercury> * 144, <thaumcraft:quicksilver>, 312);
Alloy.addRecipe(<liquid:soldering> * 360, [<liquid:tin> * 216, <liquid:lead> * 144]);
Alloy.addRecipe(<liquid:soldering> * 5, [<liquid:tin> * 3, <liquid:lead> * 2]);
Melting.addRecipe(<liquid:compressed_iron> * 144, <ore:ingotIronCompressed>, 624);
Alloy.addRecipe(<liquid:lead_platinum> * 144, [<liquid:lead> * 108, <liquid:platinum> * 36]);
Alloy.addRecipe(<liquid:metal_crystal_liquid> * 72, [<liquid:osmium> * 432, <liquid:lead_platinum> * 288, <liquid:xu_enchanted_metal> * 288, <liquid:conductive_iron> * 288, <liquid:temped_iron> * 288, <liquid:signalum> * 72, <liquid:lumium> * 72]);
Alloy.addRecipe(<liquid:metal_crystal_liquid>, [<liquid:osmium> * 6, <liquid:lead_platinum> * 4, <liquid:xu_enchanted_metal> * 4, <liquid:conductive_iron> * 4, <liquid:temped_iron> * 4, <liquid:signalum>, <liquid:lumium>]);
Casting.addTableRecipe(<contenttweaker:metal_crystal>, <contenttweaker:earth_crystal>, <liquid:metal_crystal_liquid>, 144, true, 1000);
Melting.addRecipe(<liquid:temped_iron> * 144, <factorytech:ingot:4>, 700);
Melting.addRecipe(<liquid:mithril> * 144, <thermalfoundation:material:136>, 800);
Casting.addTableRecipe(<factorytech:ingot:4>, <tconstruct:cast_custom>, <liquid:temped_iron>, 144, false, 40);
Casting.addTableRecipe(<thermalfoundation:material:136>, <tconstruct:cast_custom>, <liquid:mithril>, 144, false, 40);
Casting.addTableRecipe(<pneumaticcraft:ingot_iron_compressed>, <tconstruct:cast_custom>, <liquid:compressed_iron>, 144, false, 40);
Alloy.removeRecipe(<liquid:conductive_iron>);

Alloy.addRecipe(<liquid:alubrass> * 72, [<liquid:aluminum> * 54, <liquid:copper> * 18]);
Alloy.addRecipe(<liquid:bronze> * 72, [<liquid:copper> * 54, <liquid:tin> * 18]);
Alloy.addRecipe(<liquid:electrum> * 72, [<liquid:silver> * 36, <liquid:gold> * 36]);
Alloy.addRecipe(<liquid:ferroboron> * 72, [<liquid:boron> * 36, <liquid:steel> * 36]);
Alloy.addRecipe(<liquid:steel> * 72, [<liquid:iron> * 72, <liquid:coal> * 200]);
