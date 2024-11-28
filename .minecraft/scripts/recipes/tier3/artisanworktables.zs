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
