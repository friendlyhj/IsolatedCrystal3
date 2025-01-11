#reloadable

import scripts.recipes.lib.ArtisanRecipeBuilder as RecipeBuilder;

RecipeBuilder.get("blacksmith")
  .setShaped([
    [<factorytech:ingot:4>, <enderio:item_basic_capacitor>, <factorytech:ingot:4>],
    [<factorytech:ingot:4>, <contenttweaker:metal_crystal>, <factorytech:ingot:4>],
    [<factorytech:ingot:4>, <thermalfoundation:material:293>, <factorytech:ingot:4>]])
  .addTool(<ore:artisansHammer>, 50)
  .setFluid(<liquid:soldering> * 576)
  .addOutput(<mekanism:basicblock:8>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [null, <immersiveengineering:material:21>, <enderio:item_material:20>],
    [<immersiveengineering:material:21>, <contenttweaker:electric_crystal>, <immersiveengineering:material:21>],
    [<enderio:item_material:20>, <immersiveengineering:material:21>, null]])
  .addTool(<ore:artisansSolderer>, 10)
  .setFluid(<liquid:soldering> * 144)
  .addOutput(<enderio:item_basic_capacitor>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<enderio:item_alloy_ingot:6>, <enderio:item_basic_capacitor>, <enderio:item_alloy_ingot:6>],
    [<factorytech:machinepart:91>, <contenttweaker:metal_crystal>, <factorytech:machinepart:91>],
    [<enderio:item_alloy_ingot:6>, <thermalfoundation:material:290>, <enderio:item_alloy_ingot:6>]])
  .addTool(<ore:artisansSolderer>, 50)
  .setFluid(<liquid:soldering> * 576)
  .addOutput(<enderio:item_material:1>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<mekanism:polyethene:2>, <mekanism:polyethene:2>, <mekanism:polyethene:2>],
    [<contenttweaker:astral_crystal>, <contenttweaker:aura_crystal>, <contenttweaker:astral_crystal>],
    [<appliedenergistics2:material:8>, <appliedenergistics2:material:8>, <appliedenergistics2:material:8>]])
  .addOutput(<calculator:calculatorscreen>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<appliedenergistics2:material:38>, <calculator:flawlessglass>, <appliedenergistics2:material:38>],
    [<calculator:flawlessglass>, <calculator:calculatorlocator>, <calculator:flawlessglass>],
    [<appliedenergistics2:controller>, <calculator:flawlessglass>, <appliedenergistics2:controller>]])
  .addTool(<artisanworktables:artisans_solderer_invar>, 50)
  .setFluid(<liquid:soldering> * 288)
  .addOutput(<modularmachinery:digital_calculator_controller>)
  .create();

RecipeBuilder.get("chef")
  .setShapeless([<minecraft:mycelium>, <minecraft:mycelium>, <minecraft:glass>, <minecraft:mycelium>, <contenttweaker:blood_crystal>])
  .setFluid(<liquid:water> * 1000)
  .addTool(<ore:artisansBeaker>, 20)
  .addOutput(<minecraft:dirt> * 2)
  .setExtraOutputOne(<contenttweaker:lactic_acid_bacteria>, 0.05)
  .create();

RecipeBuilder.get("chef")
  .setShapeless([<contenttweaker:lactic_acid_bacteria>, <minecraft:sugar>, <minecraft:sugar>, <minecraft:sugar>, <minecraft:sugar>])
  .addTool(<ore:artisansBeaker>, 2)
  .setFluid(<liquid:water> * 1000)
  .addOutput(<contenttweaker:lactic_acid_mixture>)
  .create();

RecipeBuilder.get("chef")
  .setShapeless([<minecraft:sugar>, <minecraft:sugar>, <minecraft:sugar>, <minecraft:sugar>])
  .addTool(<ore:artisansBeaker>, 2)
  .setFluid(<liquid:lactic_acid> * 20)
  .addOutput(<contenttweaker:lactic_acid_mixture>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<nuclearcraft:part:6>, <nuclearcraft:part:6>, <nuclearcraft:part:6>],
    [<contenttweaker:logic_crystal>, <enderio:item_basic_capacitor:1>, <contenttweaker:logic_crystal>],
    [<nuclearcraft:part:6>, <ore:gearAluminum>, <nuclearcraft:part:6>]])
  .addTool(<ore:artisansSpanner>, 16)
  .addOutput(<extrautils2:machine>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<emergingtechnology:plasticrod>, <contenttweaker:blood_crystal>, <emergingtechnology:plasticrod>],
    [<emergingtechnology:plasticrod>, <contenttweaker:logic_crystal>, <emergingtechnology:plasticrod>],
    [<emergingtechnology:plasticrod>, <enderio:item_basic_capacitor>, <emergingtechnology:plasticrod>]])
  .addTool(<ore:artisansSpanner>, 10)
  .addOutput(<emergingtechnology:machinecase>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<mekanism:polyethene:1>, <contenttweaker:blood_crystal>, <mekanism:polyethene:1>],
    [<mekanism:polyethene:1>, <contenttweaker:logic_crystal>, <mekanism:polyethene:1>],
    [<mekanism:polyethene:1>, <enderio:item_basic_capacitor>, <mekanism:polyethene:1>]])
  .addTool(<ore:artisansSpanner>, 10)
  .addOutput(<emergingtechnology:machinecase>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<bloodmagic:slate:4>, <minecraft:nether_star>, <bloodmagic:slate:4>],
    [<emergingtechnology:purplebulb>, <enderio:item_material:53>, <emergingtechnology:purplebulb>],
    [<bloodmagic:slate:4>, <enderio:item_material:42>, <bloodmagic:slate:4>]])
  .addTool(<ore:artisansSpanner>, 120)
  .addOutput(<modularmachinery:life_constructor_controller>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<botania:manaresource:14>, <botania:manaresource:14>, <botania:manaresource:14>],
    [<botaniverse:morerune:2>, <minecraft:emerald_block>, <botaniverse:morerune:2>],
    [<botania:manaresource:14>, <botania:manaresource:14>, <botania:manaresource:14>]])
  .addTool(<ore:artisansGrimoire>, 120)
  .setFluid(<liquid:mercury> * 2880)
  .addOutput(<modularmachinery:natural_grace_controller>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<enderio:block_alloy:7>, <contenttweaker:blood_crystal>, <enderio:block_alloy:7>],
    [<contenttweaker:blood_crystal>, <enderio:item_material:1>, <contenttweaker:blood_crystal>],
    [<enderio:block_alloy:7>, <contenttweaker:blood_crystal>, <enderio:block_alloy:7>]])
  .addTool(<ore:artisansGrimoire>, 10)
  .setFluid(<liquid:mercury> * 576)
  .addOutput(<enderio:item_material:53>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateLead>, <enderio:item_basic_capacitor:1>, <ore:plateLead>],
    [<contenttweaker:logic_crystal>, <contenttweaker:metal_crystal>, <contenttweaker:logic_crystal>],
    [<ore:plateLead>, <thermalfoundation:material:288>, <ore:plateLead>]])
  .addTool(<ore:artisansSolderer>, 10)
  .setFluid(<liquid:soldering> * 576)
  .addOutput(<nuclearcraft:part:10>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<nuclearcraft:part>, <factorytech:oredrill>, <nuclearcraft:part>],
    [<calculator:material:4>, <nuclearcraft:part:10>, <calculator:material:4>],
    [<nuclearcraft:part>, <contenttweaker:warp_crystal>, <nuclearcraft:part>]])
  .addTool(<ore:artisansSolderer>, 10)
  .addOutput(<nuclearcraft:rock_crusher>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [null, <thermalfoundation:material:288>, null],
    [<thermalfoundation:material:288>, <nuclearcraft:part:10>, <thermalfoundation:material:288>],
    [null, <thermalfoundation:material:288>, null]])
  .addTool(<ore:artisansSolderer>, 10)
  .addOutput(<nuclearcraft:manufactory>)
  .create();

RecipeBuilder.get("blacksmith")
  .setShaped([
    [<ore:plateLead>, <nuclearcraft:dust:8>],
    [<nuclearcraft:dust:8>, <ore:plateLead>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<nuclearcraft:part> * 2)
  .create();

RecipeBuilder.get("blacksmith")
  .setShaped([
    [null, <ore:dustLithium>, null],
    [<nuclearcraft:alloy:1>, <nuclearcraft:part>, <nuclearcraft:alloy:1>],
    [null, <ore:dustLithium>, null]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<nuclearcraft:part:1>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<nuclearcraft:alloy:6>, null, <nuclearcraft:alloy:6>],
    [<astralsorcery:itemcraftingcomponent:2>, <immersiveengineering:metal_decoration0:1>, <astralsorcery:itemcraftingcomponent:2>],
    [<thermalfoundation:material:133>, <thermalfoundation:material:288>, <thermalfoundation:material:133>]])
  .addTool(<ore:artisansSolderer>, 10)
  .setFluid(<liquid:soldering> * 144)
  .addOutput(<nuclearcraft:part:7>)
  .create();

RecipeBuilder.get("blacksmith")
  .setShaped([
    [<thermalfoundation:material:1024>, <nuclearcraft:uranium:10>, <thermalfoundation:material:1024>],
    [<nuclearcraft:uranium:10>, <nuclearcraft:part:1>, <nuclearcraft:uranium:10>],
    [<thermalfoundation:material:1024>, <nuclearcraft:uranium:10>, <thermalfoundation:material:1024>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<nuclearcraft:part:2>)
  .create();

RecipeBuilder.get("blacksmith")
  .setShaped([
    [<nuclearcraft:compound:1>, <nuclearcraft:ingot:10>, <nuclearcraft:compound:1>],
    [<nuclearcraft:ingot:10>, <nuclearcraft:part:2>, <nuclearcraft:ingot:10>],
    [<nuclearcraft:compound:1>, <nuclearcraft:ingot:10>, <nuclearcraft:compound:1>]])
  .addTool(<ore:artisansHammer>, 4)
  .addOutput(<nuclearcraft:part:3>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateSteel>, null, <ore:plateSteel>],
    [<ore:plateSteel>, <contenttweaker:metal_crystal>, <ore:plateSteel>],
    [<embers:block_caminite_brick>, <contenttweaker:electric_crystal>, <embers:block_caminite_brick>]])
  .addTool(<ore:artisansSpanner>, 10)
  .addOutput(<embers:ember_activator>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [null, <contenttweaker:aura_crystal>, null],
    [null, <contenttweaker:electric_crystal>, null],
    [<ore:plateSteel>, <embers:plate_caminite>, <ore:plateSteel>]])
  .addTool(<ore:artisansSpanner>, 10)
  .addOutput(<embers:ember_emitter> * 2)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateSignalum>, <contenttweaker:aura_crystal>, <ore:plateSignalum>],
    [<ore:plateSteel>, <embers:plate_caminite>, <ore:plateSteel>]])
  .addTool(<ore:artisansSpanner>, 10)
  .addOutput(<embers:ember_receiver> * 2)
  .create();

RecipeBuilder.get("blacksmith")
  .setShaped([
    [<calculator:reinforcedironingot>, <thermalfoundation:material:256>, <calculator:reinforcedironingot>],
    [null, <embers:block_caminite_brick>, null],
    [<calculator:reinforcedironingot>, <thermalfoundation:material:256>, <calculator:reinforcedironingot>]])
  .addTool(<ore:artisansHammer>, 10)
  .setFluid(<liquid:soldering> * 144)
  .addOutput(<embers:mech_core>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [null, <contenttweaker:electric_crystal>, null],
    [<contenttweaker:electric_crystal>, <contenttweaker:aura_crystal>, <contenttweaker:electric_crystal>],
    [<ore:plateSteel>, <contenttweaker:electric_crystal>, <ore:plateSteel>]])
  .addTool(<ore:artisansSpanner>, 10)
  .addOutput(<embers:ember_relay> * 4)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateSteel>, <factorytech:magnetblock>, <ore:plateSteel>],
    [<ore:ingotElectrum>, <immersiveengineering:metal_decoration0>, <ore:ingotElectrum>],
    [<ore:plateSteel>, <calculator:powercube>, <ore:plateSteel>]])
  .addTool(<ore:artisansSpanner>, 10)
  .setFluid(<liquid:soldering> * 288)
  .addOutput(<immersiveengineering:metal_decoration0:6>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<calculator:flawlessdiamond>, <tconstruct:metal:2>, <calculator:flawlessdiamond>],
    [<tconstruct:large_plate>.withTag({Material: "tough"}), <extrautils2:compressedcobblestone:3>, <tconstruct:large_plate>.withTag({Material: "tough"})],
    [<thermalfoundation:material:264>, <actuallyadditions:block_misc:8>, <thermalfoundation:material:264>]])
  .setFluid(<liquid:mine_medium> * 4000)
  .addTool(<ore:artisansSpanner>, 25)
  .addOutput(<modularmachinery:mine_catalyst_controller>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<appliedenergistics2:material:47>, <contenttweaker:space_matrix>, <appliedenergistics2:material:47>],
    [<appliedenergistics2:spatial_pylon>, <ore:blockLead>, <appliedenergistics2:spatial_pylon>],
    [<appliedenergistics2:material:47>, <contenttweaker:space_matrix>, <appliedenergistics2:material:47>]])
  .addTool(<artisanworktables:artisans_spanner_invar>, 25)
  .setFluid(<liquid:soldering> * 288)
  .addOutput(<modularmachinery:time_transmutator_controller>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<mekanism:controlcircuit:3>, <mekanism:basicblock2:3>.withTag({tier: 2}), <mekanism:controlcircuit:3>],
    [<nuclearcraft:turbine_dynamo_coil:5>, <enderio:item_material:54>, <nuclearcraft:turbine_dynamo_coil:5>],
    [<mekanism:controlcircuit:3>, <calculator:material:7>, <mekanism:controlcircuit:3>]])
  .addTool(<ore:artisansSpanner>, 25)
  .setFluid(<liquid:soldering> * 288)
  .addOutput(<modularmachinery:energy_field_emitter_controller>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<embers:block_caminite_brick>, <embers:archaic_circuit>, <embers:block_caminite_brick>],
    [<embers:ember_cluster>, <mekanism:basicblock:8>, <embers:ember_cluster>],
    [<embers:block_caminite_brick>, <embers:ember_cluster>, <embers:block_caminite_brick>]])
  .addTool(<ore:artisansSpanner>, 25)
  .addOutput(<gugu-utils:emberinputhatch:3>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<naturesaura:sky_ingot>, <minecraft:ender_eye>, <naturesaura:sky_ingot>],
    [<naturesaura:token_euphoria>, <contenttweaker:aura_crystal>, <naturesaura:token_euphoria>],
    [<naturesaura:sky_ingot>, <naturesaura:token_euphoria>, <naturesaura:sky_ingot>]])
  .addTool(<ore:artisansGrimoire>, 25)
  .addOutput(<gugu-utils:aurainputhatch>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<thaumcraft:plate:3>, <contenttweaker:warp_crystal>, <thaumcraft:plate:3>],
    [<thaumicaugmentation:fortified_glass>, <thaumicaugmentation:material:5>, <thaumicaugmentation:fortified_glass>],
    [<thaumcraft:plate:3>, <contenttweaker:warp_crystal>, <thaumcraft:plate:3>]])
  .addTool(<ore:artisansGrimoire>, 25)
  .setFluid(<liquid:mercury> * 2880)
  .addOutput(<modularmachinery:blockimpetusproviderinput>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<nuclearcraft:ingot_block:14>, <thermaldynamics:duct_0:5>, <ore:blockElectrum>],
    [<thermaldynamics:duct_0:5>, <factorytech:machinepart:170>, <thermaldynamics:duct_0:5>],
    [<ore:blockElectrum>, <thermaldynamics:duct_0:5>, <nuclearcraft:ingot_block:14>]])
  .setFluid(<liquid:emergency_coolant> * 2000)
  .addOutput(<contenttweaker:superconductor>)
  .create();
