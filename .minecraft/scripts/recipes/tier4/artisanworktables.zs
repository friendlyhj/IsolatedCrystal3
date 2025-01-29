#reloadable

import scripts.recipes.lib.ArtisanRecipeBuilder as RecipeBuilder;

RecipeBuilder.get("mage")
  .setShaped([
    [<extrautils2:decorativesolid:8>, <botania:bifrostperm>, <extrautils2:decorativesolid:8>],
    [<botania:bifrostperm>, <draconicevolution:draconium_block>, <botania:bifrostperm>],
    [<extrautils2:decorativesolid:8>, <botania:bifrostperm>, <extrautils2:decorativesolid:8>]])
  .addTool(<ore:artisansGrimoire>, 20)
  .setFluid(<liquid:mercury> * 864)
  .addOutput(<draconicevolution:draconic_core>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<thaumcraft:ingot:1>, <extrautils2:simpledecorative:2>, <thaumcraft:ingot:1>],
    [<thaumcraft:ingot:1>, <contenttweaker:iris_crystal>, <thaumcraft:ingot:1>],
    [<draconicevolution:draconic_core>, <draconicevolution:draconic_core>, <draconicevolution:draconic_core>]])
  .addTool(<ore:artisansGrimoire>, 40)
  .setFluid(<liquid:mercury> * 864)
  .addOutput(<draconicevolution:wyvern_core>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<nuclearcraft:lithium_ion_battery_basic>.withTag({energyStorage: {capacity: 32000000 as long, energy: 0 as long}}), <contenttweaker:iris_crystal>, <nuclearcraft:lithium_ion_battery_basic>.withTag({energyStorage: {capacity: 32000000 as long, energy: 0 as long}})],
    [<enderio:item_basic_capacitor:2>, <draconicevolution:draconic_core>, <enderio:item_basic_capacitor:2>],
    [<nuclearcraft:lithium_ion_battery_basic>.withTag({energyStorage: {capacity: 32000000 as long, energy: 0 as long}}), <factorytech:machinepart:170>, <nuclearcraft:lithium_ion_battery_basic>.withTag({energyStorage: {capacity: 32000000 as long, energy: 0 as long}})]])
  .addTool(<ore:artisansGrimoire>, 40)
  .setFluid(<liquid:mercury> * 864)
  .addOutput(<draconicevolution:wyvern_energy_core>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<contenttweaker:space_time_crystal>, <contenttweaker:energy_crystal>, <contenttweaker:space_time_crystal>],
    [<nuclearcraft:alloy:2>, <draconicevolution:wyvern_energy_core>, <nuclearcraft:alloy:2>],
    [<contenttweaker:space_time_crystal>, <contenttweaker:energy_crystal>, <contenttweaker:space_time_crystal>]])
  .addTool(<ore:artisansGrimoire>, 40)
  .addOutput(<draconicevolution:fusion_crafting_core>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<contenttweaker:energy_crystal>, <contenttweaker:perditio_crystal>, <contenttweaker:energy_crystal>],
    [<nuclearcraft:alloy:1>, <draconicevolution:draconic_core>, <nuclearcraft:alloy:1>],
    [<nuclearcraft:alloy:1>, <nuclearcraft:alloy:1>, <nuclearcraft:alloy:1>]])
  .addTool(<ore:artisansGrimoire>, 40)
  .addOutput(<draconicevolution:crafting_injector>)
  .create();