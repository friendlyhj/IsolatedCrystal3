import mods.astralsorcery.Altar;
import mods.astralsorcery.LightTransmutation;

Altar.addDiscoveryAltarRecipe("isolatedcrystal:starmetal", <astralsorcery:itemcraftingcomponent:1>, 250, 200, [
    null, <ore:ingotTin>, null,
    <ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>,
    null, <ore:ingotTin>, null
]);

LightTransmutation.removeTransmutation(<astralsorcery:blockcustomore:1>, true);
LightTransmutation.addTransmutation(<thermalfoundation:ore:1>, <astralsorcery:blockcustomore:1>, 150);

Altar.addAttunementAltarRecipe("isolatedcrystal:astral_crystal", <contenttweaker:astral_crystal>, 250, 2000, [
    <ore:gemLapis>, <astralsorcery:itemcelestialcrystal>, <ore:gemLapis>,
    <astralsorcery:itemcraftingcomponent>, <contenttweaker:ocean_crystal>, <astralsorcery:itemcraftingcomponent>,
    <forge:bucketfilled>.withTag({FluidName: "astralsorcery.liquidstarlight", Amount: 1000}), <ore:manaDiamond>, <forge:bucketfilled>.withTag({FluidName: "astralsorcery.liquidstarlight", Amount: 1000}),
    <astralsorcery:itemcraftingcomponent:2>, <astralsorcery:itemcraftingcomponent:2>, <astralsorcery:itemcraftingcomponent:2>, <astralsorcery:itemcraftingcomponent:2>
]);
