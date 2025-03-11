#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.recipes.lib.Util.modItems;
import scripts.recipes.lib.Util.recipeTweak;

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
recipes.addShaped(<calculator:calculatorassembly> * 4, [
    [<sonarcore:reinforcedstoneblock>, <mekanism:polyethene:2>, <sonarcore:reinforcedstoneblock>],
    [<mekanism:polyethene:2>, <contenttweaker:logic_crystal>,<mekanism:polyethene:2>],
    [<sonarcore:reinforcedstoneblock>, <mekanism:polyethene:2>, <sonarcore:reinforcedstoneblock>]
]);

recipes.remove(<calculator:advancedassembly>);
recipes.addShaped(<calculator:advancedassembly> * 4, [
    [<calculator:enrichedgoldingot>, <calculator:calculatorassembly>, <calculator:enrichedgoldingot>],
    [<calculator:calculatorassembly>, <appliedenergistics2:material:36>, <calculator:calculatorassembly>],
    [<calculator:enrichedgoldingot>, <calculator:calculatorassembly>, <calculator:enrichedgoldingot>]
]);

recipes.remove(<calculator:atomicmodule>);
recipes.addShaped(<calculator:atomicmodule> * 4, [
    [<calculator:smalltanzanite>, <calculator:advancedassembly>, <calculator:smalltanzanite>],
    [<calculator:advancedassembly>, <mekanism:controlcircuit:3>, <calculator:advancedassembly>],
    [<calculator:smalltanzanite>, <calculator:advancedassembly>, <calculator:smalltanzanite>]
]);

val ex = <extrautils2:machine>.only(function(item) {return !item.hasTag; });
val ed = <extrautils2:machine>.withTag({Type:"extrautils2:generator"});
val gc = <immersiveengineering:metal_decoration0:6>;

recipes.removeByRecipeName("extrautils2:machine_base");
recipes.removeByRegex("industrialforegoing:.*_thermal");
recipes.removeByRegex("industrialforegoing:.*_enderio");
recipes.removeByRegex("industrialforegoing:.*_mekanism");
recipes.replaceAllOccurrences(<teslacorelib:machine_case>, ex, modItems("industrialforegoing"));
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
recipes.replaceAllOccurrences(<minecraft:redstone>, gc, <thermalexpansion:dynamo:*>);
recipes.replaceAllOccurrences(<minecraft:iron_block>, gc, modItems("emergingtechnology").only(function(item) {
    return item.definition.id.contains("generator");
}));
recipes.replaceAllOccurrences(<minecraft:furnace>, gc, modItems("industrialforegoing").only(function(item) {
    return item.definition.id.contains("generator");
}));


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
recipes.remove(<immersiveengineering:metal_decoration0:6>);
recipes.remove(<draconicevolution:grinder>);

recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_survival"}),[
    [<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>],
    [<ore:ingotCopper>, <immersiveengineering:metal_decoration0:6>, <ore:ingotCopper>],
    [<ore:stone>,ex,<ore:stone>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator"}),[
    [<ore:ingotIron>, <ore:ingotIron>,<ore:ingotIron>],
    [<ore:ingotIron>, <immersiveengineering:metal_decoration0:6>,<ore:ingotIron>],
    [<ore:stone>,ex,<ore:stone>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_lava"}),[
    [<ore:ingotGold>,<ore:ingotGold>,<ore:ingotGold>],
    [<ore:ingotGold>,<ore:gearInvar>,<ore:ingotGold>],
    [<ore:ingotLead>,ex,<ore:ingotLead>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_culinary"}),[
    [<enderio:item_alloy_ingot>,<enderio:item_alloy_ingot>,<enderio:item_alloy_ingot>],
    [<enderio:item_alloy_ingot>,<ore:gearSteel>,<enderio:item_alloy_ingot>],
    [<ore:ingotIron>,ed,<ore:ingotIron>]
]);
recipeTweak(false, <extrautils2:machine>.withTag({Type:"extrautils2:generator_redstone"}),[
    [<extrautils2:machine>.withTag({Type:"extrautils2:generator_lava"}), <minecraft:redstone_block>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_ender"}),[
    [<minecraft:ender_pearl>,<minecraft:ender_eye>,<minecraft:ender_pearl>],
    [<minecraft:ender_pearl>,<ore:gearEnderium>,<minecraft:ender_pearl>],
    [<actuallyadditions:item_crystal:1>,ed,<actuallyadditions:item_crystal:1>]]
);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_potion"}),[
    [<enderio:item_alloy_ingot:6>,<enderio:item_alloy_ingot:6>,<enderio:item_alloy_ingot:6>],
    [<enderio:item_alloy_ingot:6>,<minecraft:brewing_stand>,<enderio:item_alloy_ingot:6>],
    [<actuallyadditions:item_crystal:1>,ed,<actuallyadditions:item_crystal:1>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_pink"}),[
    [<minecraft:wool:6>,<minecraft:wool:6>,<minecraft:wool:6>],
    [<minecraft:wool:6>,<ore:gearSilver>,<minecraft:wool:6>],
    [<minecraft:dirt>,<extrautils2:machine>.withTag({Type:"extrautils2:generator_survival"}),<minecraft:dirt>]
]);
recipeTweak(false, <extrautils2:machine>.withTag({Type:"extrautils2:generator_overclock"}),[
    [ed,<ore:gearLumium>,<ore:gearInvar>,<ore:gearElectrum>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_tnt"}),[
    [<minecraft:tnt>,<minecraft:tnt>,<minecraft:tnt>],
    [<minecraft:tnt>,<ore:gearBronze>,<minecraft:tnt>],
    [<ore:obsidian>,ed,<ore:obsidian>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_netherstar"}),[
    [<ore:ingotUnstable>,<minecraft:nether_star>,<ore:ingotUnstable>],
    [<ore:ingotUnstable>,<extrautils2:simpledecorative:2>,<ore:ingotUnstable>],
    [<mekanism:basicblock:2>,<extrautils2:machine>.withTag({Type:"extrautils2:generator_overclock"}),<mekanism:basicblock:2>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_dragonsbreath"}),[
    [<minecraft:end_rod>,<minecraft:dragon_breath>,<minecraft:end_rod>],
    [<minecraft:end_rod>,<ore:gearLumium>,<minecraft:end_rod>],
    [<minecraft:end_stone>,<extrautils2:machine>.withTag({Type:"extrautils2:generator_potion"}),<minecraft:end_stone>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_ice"}),[
    [<thermalfoundation:material:1025>,<minecraft:ice>,<thermalfoundation:material:1025>],
    [<minecraft:snow>,<ore:gearConstantan>,<minecraft:snow>],
    [<ore:ingotSilver>,ex,<ore:ingotSilver>]
]);
recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:generator_death"}),[
    [<minecraft:bone_block>,<ore:itemSkull>,<minecraft:bone_block>],
    [<minecraft:bone_block>,<ore:gearTin>,<minecraft:bone_block>],
    [<ore:dustGlowstone>,ed,<ore:dustGlowstone>]]);
recipeTweak(false, <extrautils2:machine>.withTag({Type:"extrautils2:generator_enchant"}),[
    [<extrautils2:machine>.withTag({Type:"extrautils2:generator_potion"}),<ore:gearPlatinum>,<minecraft:enchanted_book>,<minecraft:enchanted_book>]
]);
recipeTweak(false, <extrautils2:machine>.withTag({Type:"extrautils2:generator_slime"}),[
    [<extrautils2:machine>.withTag({Type:"extrautils2:generator_ice"}),<ore:gearNickel>,<ore:slimeball>,<ore:slimeball>]
]);
recipeTweak(true, <enderio:block_combustion_generator>, [
    [<ore:ingotDarkSteel>, <ore:ingotDarkSteel>, <ore:ingotDarkSteel>],
    [<enderio:block_tank>, gc, <enderio:block_tank>],
    [<ore:gearDark>, <enderio:item_material:1>, <ore:gearDark>]
]);
recipeTweak(true, <enderio:block_stirling_generator>, [
    [<ore:ingotDarkSteel>, <ore:ingotDarkSteel>, <ore:ingotDarkSteel>],
    [<contenttweaker:heated_crystal>, gc, <contenttweaker:heated_crystal>],
    [<ore:gearDark>, <enderio:item_material:1>, <ore:gearDark>]
]);
recipeTweak(true, <enderio:block_zombie_generator>, [
    [<ore:ingotElectricalSteel>, <ore:ingotElectricalSteel>, <ore:ingotElectricalSteel>],
    [<enderio:block_fused_quartz>, <enderio:item_material:40>, <enderio:block_fused_quartz>],
    [<enderio:block_fused_quartz>, gc, <enderio:block_fused_quartz>]
]);
recipeTweak(true, <enderio:block_zombie_generator>, [
    [<ore:ingotElectricalSteel>, <ore:ingotElectricalSteel>, <ore:ingotElectricalSteel>],
    [<enderio:block_fused_quartz>, <enderio:item_material:40>, <enderio:block_fused_quartz>],
    [<enderio:block_fused_quartz>, gc, <enderio:block_fused_quartz>]
]);
recipeTweak(true, <enderio:block_franken_zombie_generator>, [
    [<ore:ingotSoularium>, <ore:ingotSoularium>, <ore:ingotSoularium>],
    [<enderio:block_fused_quartz>, <enderio:item_material:42>, <enderio:block_fused_quartz>],
    [<enderio:block_fused_quartz>, gc, <enderio:block_fused_quartz>]
]);
recipeTweak(true, <enderio:block_ender_generator>, [
    [<ore:ingotEndSteel>, <ore:ingotEndSteel>, <ore:ingotEndSteel>],
    [<enderio:block_fused_quartz>, <enderio:item_material:43>, <enderio:block_fused_quartz>],
    [<enderio:block_fused_quartz>, gc, <enderio:block_fused_quartz>]
]);
recipeTweak(true, <nuclearcraft:turbine_rotor_shaft> * 4, [
    [<ore:ingotHSLASteel>, <mekanismgenerators:generator:9>, <ore:ingotHSLASteel>],
    [<ore:ingotTough>, gc, <ore:ingotTough>],
    [<ore:ingotHSLASteel>, <mekanismgenerators:generator:9>, <ore:ingotHSLASteel>]
]);
recipeTweak(true, <factorytech:batterygen>, [
    [<ore:ingotCopper>, <factorytech:machinepart:140>, <ore:ingotCopper>],
    [<factorytech:machinepart:140>, gc, <factorytech:machinepart:140>],
    [<ore:ingotCopper>, <factorytech:machinepart:140>, <ore:ingotCopper>]
]);
recipeTweak(true, <factorytech:coregen>, [
    [<ore:ingotRefinedObsidian>, <factorytech:machinepart:170>, <ore:ingotRefinedObsidian>],
    [<factorytech:machinepart:170>, gc, <factorytech:machinepart:170>],
    [<ore:ingotRefinedObsidian>, <factorytech:machinepart:170>, <ore:ingotRefinedObsidian>]
]);
recipeTweak(true, <botania:manabomb>, [
    [<botania:livingwood>, <minecraft:tnt>, <botania:livingwood>],
    [<minecraft:tnt>, <botania:rune:13>, <minecraft:tnt>],
    [<botania:livingwood>, <minecraft:tnt>, <botania:livingwood>]
]);
recipeTweak(false, <immersiveengineering:metal_device1:2>, [
    [gc, <ore:gearCopper>]
]);
recipeTweak(true, <modularrouters:blank_module> * 2, [
    [null, <contenttweaker:logic_crystal>, null],
    [<contenttweaker:logic_crystal>, <ore:plateIron>, <contenttweaker:logic_crystal>],
    [<ore:nuggetGold>, <ore:nuggetGold>, <ore:nuggetGold>]
]);
recipeTweak(true, <modularrouters:blank_upgrade> * 2, [
    [<thaumadditions:mithrillium_nugget>, <contenttweaker:logic_crystal>, <contenttweaker:logic_crystal>],
    [<thaumadditions:mithrillium_nugget>, <ore:plateIron>, <thaumadditions:mithrillium_nugget>],
    [null, <contenttweaker:metal_crystal>, <thaumadditions:mithrillium_nugget>]
]);
recipeTweak(true, <modularrouters:item_router>, [
    [<contenttweaker:aura_crystal>, <minecraft:ender_eye>, <contenttweaker:aura_crystal>],
    [<ore:plateIron>, <thermalexpansion:frame>, <ore:plateIron>],
    [<ore:plateIron>, <modularrouters:blank_module>, <ore:plateIron>]
]);
recipeTweak(true, <pneumaticcraft:pneumatic_dynamo>, [
    [null, <thermalfoundation:material:514>, null],
    [<ore:gearIronCompressed>, <ore:ingotIronCompressed>, <ore:gearIronCompressed>],
    [<ore:ingotIronCompressed>, gc, <ore:ingotIronCompressed>]
]);
recipes.removeByRecipeName("mekanism:energycube_0");
recipes.addShaped(<mekanism:energycube>.withTag({tier: 0}), [
    [<minecraft:redstone>, <ore:battery>, <minecraft:redstone>],
    [<ore:ingotOsmium>, <ore:blockSteel>, <ore:ingotOsmium>],
    [<minecraft:redstone>, <ore:battery>, <minecraft:redstone>]
]);

mods.actuallyadditions.AtomicReconstructor.addRecipe(<thaumcraft:nugget:10>, <thermalfoundation:material:134>, 1200);
