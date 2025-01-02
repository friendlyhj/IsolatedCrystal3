#reloadable

recipes.remove(<mekanism:basicblock:8>);
recipes.remove(<enderio:item_basic_capacitor>);
recipes.remove(<mekanism:machineblock:8>);
recipes.remove(<mekanism:machineblock2:4>);
recipes.remove(<calculator:calculatorscreen>);
recipes.remove(<calculator:powercube>);
recipes.removeByRecipeName("sonarcore:tile.stablestone_normal1");

recipes.addShaped(<calculator:powercube>, [
    [<sonarcore:reinforcedstoneblock>, <sonarcore:reinforcedstoneblock>, <sonarcore:reinforcedstoneblock>],
    [<sonarcore:reinforcedstoneblock>, <enderio:item_basic_capacitor>, <sonarcore:reinforcedstoneblock>],
    [<sonarcore:reinforcedstoneblock>, <sonarcore:reinforcedstoneblock>, <sonarcore:reinforcedstoneblock>]
]);

recipes.remove(<calculator:calculatorassembly>);
recipes.addShaped(<calculator:calculatorassembly> * 2, [
    [<sonarcore:reinforcedstoneblock>, <mekanism:polyethene:2>, <sonarcore:reinforcedstoneblock>],
    [<mekanism:polyethene:2>, <contenttweaker:logic_crystal>,<mekanism:polyethene:2>],
    [<sonarcore:reinforcedstoneblock>, <mekanism:polyethene:2>, <sonarcore:reinforcedstoneblock>]
]);

recipes.remove(<calculator:advancedassembly>);
recipes.addShaped(<calculator:advancedassembly> * 2, [
    [<calculator:enrichedgoldingot>, <calculator:calculatorassembly>, <calculator:enrichedgoldingot>],
    [<calculator:calculatorassembly>, <appliedenergistics2:material:36>, <calculator:calculatorassembly>],
    [<calculator:enrichedgoldingot>, <calculator:calculatorassembly>, <calculator:enrichedgoldingot>]
]);

recipes.remove(<calculator:atomicmodule>);
recipes.addShaped(<calculator:atomicmodule> * 2, [
    [<calculator:smalltanzanite>, <calculator:advancedassembly>, <calculator:smalltanzanite>],
    [<calculator:advancedassembly>, <mekanism:controlcircuit:3>, <calculator:advancedassembly>],
    [<calculator:smalltanzanite>, <calculator:advancedassembly>, <calculator:smalltanzanite>]
]);

recipes.removeByRecipeName("extrautils2:machine_base");
recipes.removeByRegex("industrialforegoing:.*_thermal");
recipes.removeByRegex("industrialforegoing:.*_enderio");
recipes.replaceAllOccurrences(<teslacorelib:machine_case>, <extrautils2:machine>, <*>.only(function(item) {
    return item.definition.owner == "industrialforegoing";
}));
recipes.replaceAllOccurrences(<industrialforegoing:plastic>, <nuclearcraft:part:6>);
recipes.remove(<emergingtechnology:machinecase>);

recipes.remove(<extrautils2:interactionproxy>);
recipes.addShaped(<extrautils2:interactionproxy>, [
    [<thermalfoundation:material:167>, <contenttweaker:aura_crystal>, <thermalfoundation:material:167>],
    [<contenttweaker:aura_crystal>, <botania:manaresource:8>, <contenttweaker:aura_crystal>],
    [<thermalfoundation:material:167>, <contenttweaker:aura_crystal>, <thermalfoundation:material:167>]
]);

recipes.remove(<nae2:upgrade:1>);
recipes.addShaped(<nae2:upgrade:1>, [
    [<contenttweaker:calculation_crystal>, <contenttweaker:calculation_crystal>, <contenttweaker:calculation_crystal>],
    [<contenttweaker:calculation_crystal>, <appliedenergistics2:material:53>, <contenttweaker:calculation_crystal>],
    [<contenttweaker:calculation_crystal>, <contenttweaker:calculation_crystal>, <contenttweaker:calculation_crystal>]
]);

recipes.addShaped(<nae2:part:1>, [
    [<contenttweaker:calculation_crystal>, <contenttweaker:calculation_crystal>, <contenttweaker:calculation_crystal>],
    [<contenttweaker:calculation_crystal>, <appliedenergistics2:part:460>, <contenttweaker:calculation_crystal>],
    [<contenttweaker:calculation_crystal>, <contenttweaker:calculation_crystal>, <contenttweaker:calculation_crystal>]
]);

recipes.remove(<appliedenergistics2:material:58>);
recipes.addShapeless(<appliedenergistics2:material:58>, [<appliedenergistics2:material:28>, <appliedenergistics2:interface>, <contenttweaker:calculation_crystal>]);

recipes.remove(<nae2:part>);
recipes.addShaped(<nae2:part> * 2, [
    [<thermalfoundation:storage_alloy:6>, <contenttweaker:space_grid>, <thermalfoundation:storage_alloy:6>],
    [<appliedenergistics2:quartz_vibrant_glass>, <contenttweaker:calculation_crystal>, <appliedenergistics2:quartz_vibrant_glass>],
    [null, <appliedenergistics2:part:76>, null]
]);

recipes.remove(<actuallyadditions:block_misc:9>);
recipes.addShaped(<actuallyadditions:block_misc:9>, [
    [<actuallyadditions:item_misc:5>, <actuallyadditions:item_misc:5>, <actuallyadditions:item_misc:5>],
    [<actuallyadditions:item_misc:5>, <mekanism:basicblock:8>, <actuallyadditions:item_misc:5>],
    [<actuallyadditions:item_misc:5>, <actuallyadditions:item_misc:5>, <actuallyadditions:item_misc:5>]
]);

recipes.remove(<thermalexpansion:augment:497>);
recipes.addShaped(<thermalexpansion:augment:497>, [
    [null, <contenttweaker:logic_crystal>, null],
    [<ore:plateInvar>, <contenttweaker:nickel_ore_sacrifice>, <ore:plateInvar>],
    [null, <naturesaura:token_terror>, null]
]);

recipes.replaceAllOccurrences(<nuclearcraft:part:8>, <factorytech:machinepart:62>);
recipes.replaceAllOccurrences(<nuclearcraft:part:9>, <factorytech:machinepart:14>);
recipes.replaceAllOccurrences(<nuclearcraft:part:4>, <immersiveengineering:metal_decoration0>);

recipes.remove(<enderio:item_material>);

recipes.remove(<nuclearcraft:part:10>);
recipes.remove(<nuclearcraft:rock_crusher>);
recipes.remove(<nuclearcraft:manufactory>);
recipes.remove(<nuclearcraft:part>);
recipes.remove(<nuclearcraft:part:1>);
recipes.remove(<nuclearcraft:part:2>);
recipes.remove(<nuclearcraft:part:3>);
recipes.remove(<nuclearcraft:part:4>);
recipes.remove(<nuclearcraft:part:7>);
recipes.remove(<nuclearcraft:part:8>);
recipes.remove(<nuclearcraft:part:9>);

recipes.remove(<embers:blend_caminite>);
recipes.remove(<embers:ember_activator>);
recipes.remove(<embers:ember_emitter>);
recipes.remove(<embers:ember_receiver>);
recipes.remove(<embers:alchemy_pedestal>);
recipes.remove(<embers:alchemy_tablet>);
// recipes.remove(<embers:beam_cannon>);
recipes.remove(<embers:mech_core>);
recipes.remove(<embers:ember_relay>);
