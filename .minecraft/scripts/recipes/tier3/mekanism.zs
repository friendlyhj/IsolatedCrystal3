#reloadable
import mods.mekanism.reaction as Reaction;
import mods.mekanism.crusher as Crusher;

Reaction.removeRecipe(<mekanism:emptycrystals>, <gas:spentnuclearwaste>);
Reaction.removeRecipe(<mekanism:cosmicmatter>, <gas:nuclearwaste>);
Reaction.addRecipe(<actuallyadditions:item_crystal:5>, <liquid:glowstone> * 500, <gas:lithium> * 500, <mekanism:emptycrystals>, <gas:unstabledimensional> * 10, 2500, 80);
Reaction.addRecipe(<mekanism:emptycrystals> * 32, <liquid:liquidfusionfuel> * 10000, <gas:unstabledimensional> * 10000, <mekanism:cosmicmatter>, <gas:water> * 1000, 2500, 80);
Crusher.removeRecipe(<nuclearcraft:gem:6>);

