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
