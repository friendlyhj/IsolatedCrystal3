#reloadable

import mods.pneumaticcraft.thermopneumaticprocessingplant as TPP;
import mods.pneumaticcraft.pressurechamber as PressureChamber;

TPP.removeRecipe(<liquid:plastic>);
TPP.addRecipe(<liquid:vinyl_chloride> * 200, null, 1.5, 423, <fluid:plastic> * 1000);
PressureChamber.addRecipe([
    <astralsorcery:blockmarble> * 4, 
    <botania:quartz:5> * 2, 
    <contenttweaker:earth_crystal>, 
    <contenttweaker:ocean_crystal>
], 4.5f, [<astralsorcery:blockcustomore>]);

