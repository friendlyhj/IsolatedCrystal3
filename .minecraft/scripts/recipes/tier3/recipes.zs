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
