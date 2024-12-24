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
  .setFluid(<liquid:mercury> * 512)
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