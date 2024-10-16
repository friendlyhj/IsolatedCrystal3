#reloadable

import mods.pneumaticcraft.thermopneumaticprocessingplant as TPP;

TPP.removeRecipe(<liquid:plastic>);
TPP.addRecipe(<liquid:vinyl_chloride> * 200, null, 1.5, 423, <fluid:plastic> * 1000);

