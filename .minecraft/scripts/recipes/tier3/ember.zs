#reloadable
import mods.embers.Alchemy;
import mods.embers.Mixer;

Alchemy.addAspect("antimony", <soot:signet_antimony>);
Mixer.remove(<liquid:dawnstone> * 8);
Mixer.add(<liquid:dawnstone> * 12, [<liquid:energetic_alloy> * 4, <liquid:constantan> * 4, <liquid:osgloglas>]);
Mixer.add(<liquid:soldering> * 5, [<liquid:tin> * 3, <liquid:lead> * 2]);
Alchemy.add(<soot:mundane_stone>, [
    <embers:ember_cluster>,
    <thaumcraft:quicksilver>,
    <embers:plate_caminite>,
    <thermalfoundation:material:1026>,
    <actuallyadditions:item_crystal_empowered:2>
], {
    "iron": 8 .. 20,
    "copper": 8 .. 20,
    "lead": 8 .. 20,
    "silver": 8 .. 20,
    "antimony": 8 .. 20,
});
