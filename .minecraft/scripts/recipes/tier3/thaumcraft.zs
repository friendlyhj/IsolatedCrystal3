#reloadable

import mods.thaumcraft.Infusion;
import mods.thaumcraft.Crucible;

Infusion.registerRecipe("metal_infuser", "", <mekanism:machineblock:8>, 2, [
    <aspect:potentia> * 60,
    <aspect:machina> * 60,
    <aspect:metallum> * 60,
    <aspect:exitium> * 25
], <mekanism:basicblock:8>, [
    <contenttweaker:logic_crystal>,
    <contenttweaker:logic_crystal>,
    <contenttweaker:logic_crystal>,
    <contenttweaker:logic_crystal>,
    <contenttweaker:warp_crystal>,
    <contenttweaker:warp_crystal>,
    <thermalfoundation:material:1024>,
    <thermalfoundation:material:1024>
]);

Infusion.registerRecipe("electric_separator", "", <mekanism:machineblock2:4>, 2, [
    <aspect:potentia> * 60,
    <aspect:machina> * 60,
    <aspect:permutatio> * 60,
    <aspect:exitium> * 25
], <mekanism:basicblock:8>, [
    <mekanism:controlcircuit:1>,
    <mekanism:controlcircuit:1>,
    <mekanism:electrolyticcore>,
    <mekanism:electrolyticcore>,
    <mekanism:gastank>,
    <mekanism:gastank>,
    <factorytech:tankblock>,
    <botania:manaresource:2>
]);

Infusion.registerRecipe("emptiness_energizer", "", <modularmachinery:emptiness_energizer_controller>, 10, [
    <aspect:vitium> * 400,
    <aspect:praecantatio> * 200,
    <aspect:alienis> * 200,
    <aspect:potentia> * 200,
    <aspect:machina> * 200,
    <aspect:fluctus> * 100
], <actuallyadditions:block_misc:9>, [
    <thaumicaugmentation:material:3>,
    <thaumicaugmentation:material:3>,
    <thaumicaugmentation:material:3>,
    <thaumicaugmentation:material:3>,
    <thaumadditions:mithminite_ingot>,
    <thaumadditions:mithminite_ingot>,
    <thaumadditions:mithminite_ingot>,
    <thaumcraft:metal_alchemical_advanced>,
    <thaumcraft:metal_alchemical_advanced>,
    <enderio:item_material:56>,
    <enderio:item_material:56>
]);

Infusion.registerRecipe("broken_spawner", "", <enderio:item_broken_spawner>.withTag({entityId: "minecraft:zombie"}), 8, [
    <aspect:exanimis> * 128,
    <aspect:spiritus> * 128,
    <aspect:praecantatio> * 128,
    <aspect:infernum> * 128
], <enderio:item_material:53>, [
    <thaumcraft:brain>,
    <thaumcraft:brain>,
    <thaumcraft:brain>,
    <thaumcraft:brain>,
    <bloodmagic:slate:3>,
    <bloodmagic:slate:3>,
    <bloodmagic:slate:3>,
    <contenttweaker:aura_crystal>,
    <contenttweaker:aura_crystal>,
    <contenttweaker:astral_crystal>
]);

Infusion.registerRecipe("alchemy_pedestal", "", <embers:alchemy_pedestal>, 6, [
    <aspect:praecantatio> * 100,
    <aspect:ignis> * 100,
    <aspect:metallum> * 100,
    <aspect:ordo> * 100
], <embers:block_dawnstone>, [
    <embers:block_caminite_brick>,
    <embers:block_caminite_brick>,
    <embers:block_caminite_brick>,
    <embers:block_caminite_brick>,
    <ore:plateCopper>,
    <ore:plateCopper>,
    <contenttweaker:metal_crystal>,
    <contenttweaker:warp_crystal>,
    <contenttweaker:aura_crystal>
]);

Infusion.registerRecipe("grinder", "", <draconicevolution:grinder>, 6, [
    <aspect:exitium> * 250,
    <aspect:sensus> * 200,
    <aspect:machina> * 200,
    <aspect:aversio> * 200,
    <aspect:draco> * 200
], <enderio:item_material:53>, [
    <contenttweaker:perditio_crystal>,
    <contenttweaker:perditio_crystal>,
    <contenttweaker:perditio_crystal>,
    <contenttweaker:perditio_crystal>,
    <botania:manaresource:14>,
    <botania:manaresource:14>,
    <calculator:flawlessdiamondsword>
]);

Crucible.registerRecipe("exchange_tablet", "", <embers:alchemy_tablet>, <embers:alchemy_pedestal>, [
    <aspect:permutatio> * 50,
    <aspect:potentia> * 50
]);
Crucible.registerRecipe("ancient_brick", "", <embers:archaic_brick>, <embers:ingot_dawnstone>, [
    <aspect:humanus> * 5
]);
