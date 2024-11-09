import mods.astralsorcery.Altar;
import mods.astralsorcery.LightTransmutation;

Altar.addDiscoveryAltarRecipe("isolatedcrystal:starmetal", <astralsorcery:itemcraftingcomponent:1>, 250, 200, [
    null, <ore:ingotTin>, null,
    <ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>,
    null, <ore:ingotTin>, null
]);


LightTransmutation.removeTransmutation(<astralsorcery:blockcustomore:1>, true);
LightTransmutation.addTransmutation(<thermalfoundation:ore:1>, <astralsorcery:blockcustomore:1>, 150);
