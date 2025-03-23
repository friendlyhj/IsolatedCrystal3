import mods.factorytech.Electroplater;
import mods.factorytech.Agitator;
import mods.factorytech.CompressionChamber;

CompressionChamber.addRecipe(<actuallyadditions:item_misc:5>, <minecraft:quartz>, <liquid:h2so4> * 200);
Electroplater.removeRecipe(<minecraft:quartz>);
Agitator.addRecipe(<liquid:magnesium> * 144, <liquid:clay> * 576, <appliedenergistics2:material:2>, null, <embers:blend_caminite> * 4);
