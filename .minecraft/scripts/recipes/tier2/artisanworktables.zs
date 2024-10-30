#reloadable

import crafttweaker.item.IItemStack;
import scripts.recipes.lib.ArtisanRecipeBuilder as RecipeBuilder;
import scripts.libs.Util;
import native.slimeknights.tconstruct.library.TinkerRegistry;
import native.slimeknights.tconstruct.library.materials.Material;
import native.slimeknights.tconstruct.library.tools.ToolPart;

RecipeBuilder.get("engineer")
  .setShaped([
    [<botania:livingrock:1>, <contenttweaker:mana_essence>, <botania:livingrock:1>],
    [<contenttweaker:mana_essence>, <botania:rune:8>, <contenttweaker:mana_essence>],
    [<botania:livingrock:1>, <contenttweaker:mana_essence>, <botania:livingrock:1>]])
  .addOutput(<modularmachinery:blockmanaproviderinput>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [null, <minecraft:obsidian>, null],
    [<minecraft:obsidian>, <botania:manaresource:9>, <minecraft:obsidian>],
    [<thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>]])
  .addOutput(<modularmachinery:blockaspectproviderinput>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateSteel>, <contenttweaker:crafting_crystal>, <ore:plateSteel>],
    [<contenttweaker:crafting_crystal>, <minecraft:hopper>, <contenttweaker:crafting_crystal>],
    [<ore:plateSteel>, <contenttweaker:crafting_crystal>, <ore:plateSteel>]])
  .setFluid(<liquid:soldering> * 288)
  .addTool(<ore:artisansSolderer>, 10)
  .addOutput(<modularmachinery:blockinputbus>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateSteel>, <contenttweaker:crafting_crystal>, <ore:plateSteel>],
    [<contenttweaker:crafting_crystal>, <pneumaticcraft:liquid_hopper>, <contenttweaker:crafting_crystal>],
    [<ore:plateSteel>, <contenttweaker:crafting_crystal>, <ore:plateSteel>]])
  .setFluid(<liquid:soldering> * 288)
  .addTool(<ore:artisansSolderer>, 10)
  .addOutput(<modularmachinery:blockfluidinputhatch>)
  .create();

val buses as IItemStack[] = [
  <modularmachinery:blockinputbus>,
  <modularmachinery:blockfluidinputhatch>,
  <modularmachinery:blockenergyinputhatch>
];

for bus in buses {
  val tiny = bus.withDamage(0);
  val small = bus.withDamage(1);
  val normal = bus.withDamage(2);
  val reinforced = bus.withDamage(3);
  val big = bus.withDamage(4);
  val huge = bus.withDamage(5);
  val ludicrous = bus.withDamage(6);

  RecipeBuilder.get("engineer")
    .setShaped([
      [<ore:plateBronze>, <ore:gearInvar>, <ore:plateBronze>],
      [null, tiny, null],
      [<ore:plateBronze>, null, <ore:plateBronze>]])
    .addTool(<ore:artisansSolderer>, 10)
    .addOutput(small)
    .create();

  RecipeBuilder.get("engineer")
    .setShaped([
      [<ore:plateLumium>, <ore:gearSignalum>, <ore:plateLumium>],
      [null, small, null],
      [<ore:plateLumium>, null, <ore:plateLumium>]])
    .addTool(<ore:artisansSolderer>, 10)
    .addOutput(normal)
    .create();

  RecipeBuilder.get("engineer")
    .setShaped([
      [<calculator:enrichedgoldingot>, <factorytech:machinepart:14>, <calculator:enrichedgoldingot>],
      [null, normal, null],
      [<calculator:enrichedgoldingot>, null, <calculator:enrichedgoldingot>]])
    .addTool(<ore:artisansSolderer>, 20)
    .addOutput(reinforced)
    .create();

  RecipeBuilder.get("engineer")
    .setShaped([
      [<ore:ingotEnderium>, <ore:gearVibrant>, <ore:ingotEnderium>],
      [null, reinforced, null],
      [<ore:ingotEnderium>, <contenttweaker:logic_crystal>, <ore:ingotEnderium>]])
    .addTool(<ore:artisansSolderer>, 50)
    .addOutput(big)
    .create();

  RecipeBuilder.get("engineer")
    .setShaped([
      [<ore:ingotZirconium>, <ore:gearMithril>, <ore:ingotZirconium>],
      [null, big, null],
      [<ore:ingotZirconium>, <contenttweaker:logic_crystal>, <ore:ingotZirconium>]])
    .addTool(<ore:artisansSolderer>, 80)
    .addOutput(huge)
    .create();

  RecipeBuilder.get("engineer")
    .setShaped([
      [<contenttweaker:space_time_crystal>, <appliedenergistics2:spatial_pylon>, <contenttweaker:space_time_crystal>],
      [null, huge, null],
      [<contenttweaker:space_time_crystal>, <contenttweaker:calculation_crystal>, <contenttweaker:space_time_crystal>]])
    .addTool(<ore:artisansSolderer>, 150)
    .addOutput(ludicrous)
    .create();
}

RecipeBuilder.get("engineer")
  .setShaped([
    [<thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>, <thaumcraft:plank_greatwood>],
    [<contenttweaker:destruction_crystal>, <contenttweaker:destruction_crystal>, <contenttweaker:destruction_crystal>],
    [<botania:livingrock:1>, <botania:livingrock:1>, <botania:livingrock:1>]])
  .addOutput(<modularmachinery:essentia_generator_controller>)
  .create();

RecipeBuilder.get("blacksmith")
  .setShaped([
    [null, <ore:nuggetIron>, null],
    [<ore:nuggetIron>, null, <ore:nuggetIron>],
    [null, <ore:nuggetIron>, null]])
  .addTool(<ore:artisansHammer>, 2)
  .addOutput(<contenttweaker:bearing>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
    [<thaumcraft:plank_silverwood>, <thaumcraft:plank_silverwood>, <thaumcraft:plank_silverwood>],
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]])
  .addTool(<ore:artisansGrimoire>, 5)
  .setFluid(<liquid:mercury> * 144)
  .addOutput(<thaumcraft:tube> * 16)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [null, <contenttweaker:crafting_crystal>, null],
    [<contenttweaker:flesh_crystal>, <ore:gearBrass>, <contenttweaker:crafting_crystal>],
    [<ore:plateIron>, <ore:plateIron>, null]])
  .addTool(<ore:artisansGrimoire>, 10)
  .setFluid(<liquid:mercury> * 288)
  .addOutput(<thaumcraft:mechanism_simple>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [null, <thaumcraft:mechanism_simple>, null],
    [<contenttweaker:destruction_crystal>, <botania:distributor>, <contenttweaker:destruction_crystal>],
    [null, <thaumcraft:mechanism_simple>, null]])
  .addTool(<ore:artisansGrimoire>, 20)
  .addOutput(<thaumcraft:centrifuge>)
  .setFluid(<liquid:mercury> * 288)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<thaumcraft:salis_mundus>, <ore:gearSilver>, <thaumcraft:salis_mundus>],
    [<thaumcraft:filter>, <thaumcraft:centrifuge>, <thaumcraft:filter>],
    [<thaumcraft:salis_mundus>, <contenttweaker:crafting_crystal>, <thaumcraft:salis_mundus>]])
  .addTool(<ore:artisansGrimoire>, 20)
  .addOutput(<thaumadditions:aspect_combiner>)
  .setFluid(<liquid:mercury> * 288)
  .create();

RecipeBuilder.get("mage")
  .setShapeless([<ore:dustSalt>, <mekanism:salt>, <mekanism:salt>, <appliedenergistics2:material:2>, <contenttweaker:heated_crystal>, <contenttweaker:earth_crystal>, <contenttweaker:vibrant_crystal>, <contenttweaker:crafting_crystal>, <contenttweaker:destruction_crystal>])
  .addTool(<ore:artisansGrimoire>, 5)
  .addOutput(<thaumcraft:salis_mundus> * 2)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<ore:plateGold>, <thaumcraft:plank_silverwood>, <ore:plateGold>]])
  .addTool(<ore:artisansGrimoire>, 5)
  .setFluid(<liquid:mercury> * 72)
  .addOutput(<thaumcraft:filter>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<minecraft:lapis_block>, <naturesaura:infused_iron_block>, <minecraft:lapis_block>],
    [<botania:manaresource:7>, <thaumadditions:aspect_combiner>, <botania:manaresource:7>],
    [<botania:rune:3>, <ore:gearElectrum>, <botania:rune:3>]])
  .addTool(<ore:artisansGrimoire>, 20)
  .setFluid(<liquid:mercury> * 288)
  .addOutput(<thaumadditions:aura_charger>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<ore:plateInvar>, <thaumcraft:tube_filter>, <ore:plateInvar>],
    [<thaumcraft:tube>, <thaumcraft:plank_greatwood>, <thaumcraft:tube>],
    [<ore:plateInvar>, <thaumcraft:tube_valve>, <ore:plateInvar>]])
  .addTool(<ore:artisansGrimoire>, 25)
  .addOutput(<thaumcraft:metal_alchemical> * 2)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<contenttweaker:flesh_crystal>, <botania:manaresource:9>, <contenttweaker:flesh_crystal>],
    [<bloodmagic:blood_rune>, <contenttweaker:flesh_crystal>, <bloodmagic:blood_rune>],
    [<bloodmagic:blood_rune>, <bloodmagic:monster_soul>, <bloodmagic:blood_rune>]])
  .addTool(<ore:artisansGrimoire>, 40)
  .addOutput(<bloodmagic:altar>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [null, <bloodmagic:blood_rune>, null],
    [<bloodmagic:blood_rune>, <contenttweaker:flesh_crystal>, <bloodmagic:blood_rune>],
    [null, <bloodmagic:blood_rune>, null]])
  .addTool(<ore:artisansGrimoire>, 10)
  .setFluid(<liquid:mercury> * 72)
  .addOutput(<bloodmagic:slate>)
  .create();

RecipeBuilder.get("mage")
  .setShaped([
    [<bloodmagic:monster_soul>, null, <bloodmagic:monster_soul>],
    [<minecraft:nether_brick>, <thaumcraft:mechanism_simple>, <minecraft:nether_brick>],
    [<minecraft:nether_brick>, <ore:blockBloodBronze>, <minecraft:nether_brick>]])
  .addTool(<ore:artisansGrimoire>, 20)
  .setFluid(<liquid:mercury> * 288)
  .addOutput(<bloodmagic:soul_forge>)
  .create();

<ore:gearBrass>.add(<contenttweaker:brass_gear>);

for od in oreDict {
  if (!od.empty && od.name.startsWith("gear")) {
    val type = od.name.substring(4);
    val ingot = oreDict.get("ingot" ~ type);
    if (!ingot.empty) {
      var material as Material = TinkerRegistry.getMaterial(Util.toSnakeCase(type));
      if (isNull(material) || material == Material.UNKNOWN) {
        material = TinkerRegistry.getMaterial(Util.toSnakeCase(type) ~ "_plustic");
      }
      if (isNull(material) || material == Material.UNKNOWN) {
        logger.logWarning("no rod for material: " ~ type);
        continue;
      }
      val rod = <tconstruct:tool_rod>.withTag({Material: material.identifier});
      recipes.remove(od);
      RecipeBuilder.get("blacksmith")
        .setShaped([
          [rod, ingot, rod],
          [ingot, <contenttweaker:bearing>, ingot],
          [rod, ingot, rod]])
        .addTool(<ore:artisansHammer>, 5)
        .setFluid(<liquid:soldering> * 72)
        .addOutput(od.firstItem)
        .create();
    }
  }
}

RecipeBuilder.get("engineer")
  .setShaped([
    [null, <ore:plateCopper>, null],
    [<ore:plateCopper>, <contenttweaker:ocean_crystal>, <ore:plateCopper>],
    [null, <ore:plateCopper>, null]])
  .addTool(<ore:artisansSolderer>, 5)
  .addOutput(<mekanism:basicblock2> * 8)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateConstantan>, <botania:managlass>, <ore:plateConstantan>],
    [<mekanism:basicblock2>, <contenttweaker:ocean_crystal>, <mekanism:basicblock2>],
    [<mekanism:basicblock2>, <mekanism:basicblock2>, <mekanism:basicblock2>]])
  .addTool(<ore:artisansSolderer>, 10)
  .addOutput(<mekanism:basicblock:14>)
  .create();

RecipeBuilder.get("engineer")
  .setShapeless([<mekanism:basicblock2>, <minecraft:hopper>])
  .addTool(<ore:artisansSolderer>, 10)
  .addOutput(<mekanism:basicblock:15>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateInvar>, <ore:plateInvar>, <ore:plateInvar>],
    [<minecraft:furnace>, <contenttweaker:heated_crystal>, <minecraft:furnace>],
    [<ore:plateInvar>, <ore:plateInvar>, <ore:plateInvar>]])
  .addTool(<ore:artisansSolderer>, 10)
  .addOutput(<mekanism:machineblock3:6>)
  .create();

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:plateSteel>, <contenttweaker:ocean_crystal>, <ore:plateSteel>],
    [<contenttweaker:ocean_crystal>, <enderio:block_tank>, <contenttweaker:ocean_crystal>],
    [<ore:plateSteel>, <ore:blockConstantan>, <ore:plateSteel>]])
  .addTool(<ore:artisansSolderer>, 10)
  .setFluid(<liquid:soldering> * 288)
  .addOutput(<nuclearcraft:ingot_former>)
  .create();