#reloadable

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