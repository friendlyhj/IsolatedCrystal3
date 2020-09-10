#priority 0
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.grassUtils.RecipeUtils.recipeTweak;
import scripts.grassUtils.RecipeUtils.createCrossWithCore;
import scripts.recipe.Util.setBluePrintRecipe;
import scripts.compatSkills.Utils.getSkillArray;
import scripts.compatSkills.Utils.toAllSkill;
import scripts.compatSkills.SkillLocker;
import mods.artisanintegrations.requirement.Reskillable;
import mods.artisanworktables.builder.RecipeBuilder;

recipeTweak(true, <item:modularmachinery:blockcontroller>, [
    [<ore:plateInvar>, <ore:blockRedstone>, <ore:plateInvar>],
    [<ore:plateGold>, <ore:casingFerramic>, <ore:plateGold>],
    [<ore:plateInvar>, <ore:blockRedstone>, <ore:plateInvar>]
]);

recipeTweak(true, <item:modulardiversity:blockmanainputhatch>, createCrossWithCore(<ore:casingFerramic>, <ore:livingrock>, <ore:ingotManasteel>));
recipeTweak(true, <item:modulardiversity:blockmanaoutputhatch>, [[<item:modulardiversity:blockmanainputhatch>]]);
recipes.addShaped("manahatch_transform", <item:modulardiversity:blockmanainputhatch>, [[<item:modulardiversity:blockmanaoutputhatch>]]);

RecipeBuilder.get("engineer")
  .setShaped([
    [<ore:nuggetElvenElementium>, <ore:nuggetElvenElementium>, <ore:nuggetElvenElementium>],
    [<prodigytech:circuit_refined>, <ore:casingTin>, <prodigytech:circuit_refined>],
    [<ore:nuggetElvenElementium>, <ore:nuggetElvenElementium>, <ore:nuggetElvenElementium>]])
  .addTool(<ore:artisansDriver>, 20)
  .addTool(<ore:artisansSpanner>, 10)
  .addOutput(<modularmachinery:blockcasing:5>)
  .addRequirement(Reskillable.addAll(toAllSkill(getSkillArray("m7n5"))))
.create();
SkillLocker.lockItem(<item:modularmachinery:blockcasing:5>, getSkillArray("m7n5"));

######################
#     blueprints     #
######################

val design as IItemStack = <item:artisanworktables:design_pattern>;

// 魔力气热炉
setBluePrintRecipe([
    design,
    <botania:manaresource:23>, 
    <botania:manaresource:23>, 
    <botania:manaresource:23>,
    <botania:manaresource:23>,
    <thermalfoundation:material:768>, 
    <thermalfoundation:material:768>, 
    <thermalfoundation:material:768>, 
    <minecraft:furnace>
], <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:mana_aeroheater"}), "m3n4");

// 电解精炼机
setBluePrintRecipe([
    design,
    <ore:ingotCopper>,
    <ore:ingotCopper>,
    <ore:dustRedstone>,
    <ore:dustRedstone>,
    <forge:bucketfilled>.withTag({FluidName: "vinegar", Amount: 1000}),
    <ore:ingotFerramic>
], <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:electrolytic_refiner"}), "m4n5l3");

// 热空气焦炉
setBluePrintRecipe([
    design,
    <item:minecraft:furnace>,
    <ore:hardenedClay>,
    <ore:hardenedClay>,
    <ore:coal>,
    <ore:coal>
], <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:aero_coke_oven"}), "m4n4l2");

// 热空气高炉
setBluePrintRecipe([
    design,
    <item:minecraft:furnace>,
    <ore:hardenedClay>,
    <ore:hardenedClay>,
    <ore:oreIron>,
    <ore:oreIron>,
    <ore:charcoal>,
    <ore:charcoal>
], <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:aero_blast"}), "m4n4l2");

// 装配机
setBluePrintRecipe([
    design,
    <item:contenttweaker:soldering_manasteel>,
    <item:prodigytech:circuit_perfected>,
    <item:prodigytech:circuit_refined>,
    <ore:blockGlass>,
    <ore:blockGlass>,
    <ore:ingotElvenCopper>
], <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:assembler"}), "m7n5");
