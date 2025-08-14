#reloadable

import crafttweaker.item.IItemStack;
import scripts.recipes.lib.Util.modItems;
import scripts.recipes.lib.Util.recipeTweak;

recipes.removeByMod("modularmachinery");
for item in loadedMods["modularmachinery"].items {
    val id = item.definition.id;
    if (id.contains("input")) {
        val output as IItemStack = <item:${id.replace("input", "output")}:${item.metadata}>;
        if (!isNull(output)) {
            recipes.addShapeless(output, [item]);
            recipes.addShapeless(item, [output]);
        }
    }
}

recipes.addShaped(<tconstruct:cast_custom>, [
    [<tconstruct:cast>, null, null],
    [null, null, null],
    [null, null, null],
]);
recipes.addShaped(<tconstruct:cast_custom:1>, [
    [null, <tconstruct:cast>, null],
    [null, null, null],
    [null, null, null],
]);
recipes.addShaped(<tconstruct:cast_custom:2>, [
    [null, null, <tconstruct:cast>],
    [null, null, null],
    [null, null, null],
]);
recipes.addShaped(<tconstruct:cast_custom:3>, [
    [null, null, null],
    [<tconstruct:cast>, null, null],
    [null, null, null],
]);
recipes.addShaped(<tconstruct:cast>.withTag({PartType: "tconstruct:tool_rod"}), [
    [null, null, null],
    [null, <tconstruct:cast>, null],
    [null, null, null],
]);

recipes.removeByInput(<immersiveengineering:tool>);
recipes.addShaped(<artisanworktables:worktable:6>, [
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
    [<contenttweaker:crafting_crystal>, <ore:blockBronze>, <contenttweaker:crafting_crystal>],
    [<minecraft:fence>, <minecraft:fence>, <minecraft:fence>]
]);

recipes.addShaped(<artisanworktables:worktable:3>, [
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
    [<contenttweaker:crafting_crystal>, <ore:blockIron>, <contenttweaker:crafting_crystal>],
    [<minecraft:fence>, <minecraft:fence>, <minecraft:fence>]
]);

recipes.addShaped(<artisanworktables:worktable:7>, [
    [<minecraft:lapis_block>, <botania:manaresource:2>, <minecraft:lapis_block>],
    [<contenttweaker:crafting_crystal>, <thaumcraft:log_greatwood>, <contenttweaker:crafting_crystal>],
    [<botania:manaresource:13>, <botania:manaresource:13>, <botania:manaresource:13>]
]);

recipes.remove(<mekanism:basicblock:14>);
recipes.remove(<mekanism:basicblock2>);
recipes.remove(<mekanism:basicblock:15>);
recipes.remove(<mekanism:machineblock3:6>);
recipes.remove(<nuclearcraft:ingot_former>);
recipes.remove(<naturesaura:offering_table>);

recipes.addShaped(<artisanworktables:toolbox>, [
    [<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],
    [<ore:plankTreatedWood>, <ore:plateBronze>, <ore:plankTreatedWood>],
    [<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],
]);

recipes.addShaped(<artisanworktables:mechanical_toolbox>, [
    [<ore:plateIron>, <ore:gearTin>, <ore:plateIron>],
    [<ore:gearInvar>, <artisanworktables:toolbox>, <ore:gearInvar>],
    [<ore:plateIron>, <ore:gearTin>, <ore:plateIron>],
]);

recipes.remove(<thaumcraft:plate>);
recipes.remove(<thaumcraft:plate:1>);
recipes.remove(<thaumcraft:plate:2>);
recipes.remove(<bloodmagic:blood_rune>);
recipes.remove(<bloodmagic:sacrificial_dagger>);
recipes.remove(<bloodmagic:altar>);
recipes.remove(<bloodmagic:soul_snare>);
recipes.remove(<bloodmagic:soul_forge>);
recipes.remove(<factorytech:intermediate:4>);
recipes.remove(<nuclearcraft:cobblestone_generator>);
recipes.remove(<thermalexpansion:machine:15>);
recipes.removeByRecipeName("factorytech:parts/motor");
recipes.removeByRecipeName("factorytech:parts/motorgold");

recipes.remove(<factorytech:fluiddrill>);
recipes.addShaped(<factorytech:fluiddrill>, [
    [null, <factorytech:machinepart:60>, null],
    [<ore:plateInvar>, <factorytech:pipe>, <ore:plateInvar>],
    [<ore:plateInvar>, <factorytech:machinepart:72>, <ore:plateInvar>],
]);
recipes.remove(<mekanism:machineblock2>);
recipes.remove(<mekanism:machineblock2:2>);

recipes.remove(<naturesaura:calling_spirit>);
recipes.addShaped(<naturesaura:calling_spirit> * 3, [
    [null, <naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:overworld"}), null],
    [<naturesaura:infused_iron>, <botania:manaresource:9>, <naturesaura:infused_iron>],
    [null, <naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:nether"}), null]
]);
recipes.remove(<naturesaura:mover_cart>);
recipes.addShaped(<naturesaura:mover_cart>, [
    [<minecraft:ender_eye>, <contenttweaker:aura_crystal>, <minecraft:ender_eye>],
    [<contenttweaker:aura_crystal>, <naturesaura:infused_brick>, <contenttweaker:aura_crystal>],
    [null, <minecraft:minecart>, null]
]);

recipes.addShapeless(<thaumcraft:amber>, [<contenttweaker:flesh_crystal>, <naturesaura:gold_powder>]);

val i = <item:contenttweaker:item_module>;
val c = <item:contenttweaker:crafting_module>;
val r = <appliedenergistics2:material:26>;
val n  = <item:contenttweaker:network_module>;
val an  = <item:contenttweaker:advanced_network_module>;
val w  = <item:contenttweaker:write_module>;
val u  = <item:contenttweaker:usb_module>;
val f  = <item:teslacorelib:machine_case>;
val l  = <item:contenttweaker:liquid_module>;
val o  = <item:contenttweaker:world_module>;
val g = <item:contenttweaker:gas_module>;
val e  = <item:contenttweaker:essentia_module>;
val wire  = <item:appliedenergistics2:part:56>;
val b  = <item:appliedenergistics2:material:43>;
val d  = <item:appliedenergistics2:material:44>;
val p  = <item:appliedenergistics2:part:180>;

recipes.remove(<appliedenergistics2:part:220>);
recipes.addShapeless(<appliedenergistics2:part:220>, [wire, i, b, d]);
recipes.remove(<appliedenergistics2:part:440>);
recipes.addShapeless(<appliedenergistics2:part:440>, [wire, i, c, n, u]);
recipes.remove(<appliedenergistics2:part:380>);
recipes.addShapeless(<appliedenergistics2:part:380>, [p, i, n, b, d]);
recipes.remove(<item:appliedenergistics2:part:360>);
recipes.addShapeless(<item:appliedenergistics2:part:360>, [p, i, n, c, b, d]);
recipes.remove(<item:appliedenergistics2:part:340>);
recipes.addShapeless(<item:appliedenergistics2:part:340>,  [p, i, n, c, w, u, b, d]);
recipes.remove(<item:appliedenergistics2:part:480>);
recipes.addShapeless(<item:appliedenergistics2:part:480>,  [p, i, n, c, w, u]);
recipes.remove(<appliedenergistics2:interface>);
recipes.addShapeless(<appliedenergistics2:interface>, [f, i, c, n, u]);
recipes.remove(<appliedenergistics2:part:280>);
recipes.addShapeless(<appliedenergistics2:part:280>, [wire, i, n, r]);
recipes.remove(<appliedenergistics2:part:281>);
recipes.addShapeless(<appliedenergistics2:part:281>, [wire, l, n, r]);
recipes.remove(<appliedenergistics2:part:80>);
recipes.addShapeless(<appliedenergistics2:part:80>, [wire, r]);
recipes.remove(<appliedenergistics2:part:460>);
recipes.addShapeless(<appliedenergistics2:part:460> * 2, [wire, wire, an]);
recipes.remove(<item:appliedenergistics2:crafting_unit>);
recipes.addShapeless(<item:appliedenergistics2:crafting_unit>, [f, i, n, c, c, c, c]);
recipes.remove(<item:appliedenergistics2:crafting_monitor>);
recipes.addShapeless(<item:appliedenergistics2:crafting_monitor>, [f, n, c]);
recipes.remove(<appliedenergistics2:part:240>);
recipes.addShapeless(<appliedenergistics2:part:240>, [wire, i, d]);
recipes.remove(<appliedenergistics2:part:260>);
recipes.addShapeless(<appliedenergistics2:part:260>, [wire, i, b]);
recipes.remove(<item:appliedenergistics2:drive>);
recipes.addShapeless(<item:appliedenergistics2:drive>, [f, i, i, u, u, u, u, u, u]);
recipes.remove(<item:appliedenergistics2:security_station>);
recipes.addShapeless(<item:appliedenergistics2:security_station>, [<item:appliedenergistics2:chest>, <item:appliedenergistics2:material:37>, an, w]);
recipes.remove(<item:appliedenergistics2:part:400>);
recipes.addShapeless(<item:appliedenergistics2:part:400>, [p, i, n]);
recipes.remove(<item:appliedenergistics2:part:520>);
recipes.addShapeless(<item:appliedenergistics2:part:520>, [p, l, n, b, d]);
recipes.remove(<ae2fc:part_fluid_pattern_terminal>);
recipes.addShapeless(<ae2fc:part_fluid_pattern_terminal>,  [p, l, n, c, w, u, b, d]);
recipes.remove(<item:appliedenergistics2:part:522>);
recipes.addShapeless(<item:appliedenergistics2:part:522>, [p, l, n, c, w, u]);
recipes.remove(<item:appliedenergistics2:part:241>);
recipes.addShapeless(<item:appliedenergistics2:part:241>, [wire, l, d]);
recipes.remove(<item:appliedenergistics2:part:261>);
recipes.addShapeless(<item:appliedenergistics2:part:261>, [wire, l, b]);
recipes.remove(<appliedenergistics2:part:221>);
recipes.addShapeless(<appliedenergistics2:part:221>, [wire, l, b, d]);
recipes.remove(<appliedenergistics2:part:441>);
recipes.addShapeless(<appliedenergistics2:part:441>, [wire, l, c, n, u]);
recipes.remove(<appliedenergistics2:fluid_interface>);
recipes.addShapeless(<appliedenergistics2:fluid_interface>, [f, l, c, n, u]);
recipes.remove(<appliedenergistics2:part:320>);
recipes.addShapeless(<appliedenergistics2:part:320>, [wire, i, b, o]);
recipes.remove(<appliedenergistics2:part:300>);
recipes.addShapeless(<appliedenergistics2:part:300>, [wire, i, d, o]);
recipes.remove(<appliedenergistics2:part:321>);
recipes.addShapeless(<appliedenergistics2:part:321>, [wire, l, b, o]);
recipes.remove(<appliedenergistics2:part:302>);
recipes.addShapeless(<appliedenergistics2:part:302>, [wire, l, d, o]);
recipes.remove(<item:appliedenergistics2:chest>);
recipes.addShapeless(<item:appliedenergistics2:chest>, [f, <item:appliedenergistics2:part:380>, u]);
recipes.addShapeless(<thaumicenergistics:essentia_terminal>, [p, e, n, b, d]);
recipes.addShapeless(<thaumicenergistics:arcane_terminal>, [p, e, c, n, b, d]);
recipes.addShapeless(<thaumicenergistics:arcane_inscriber>, [p, e, n, c, w, u, b, d]);
recipes.remove(<mekeng:gas_terminal>);
recipes.addShapeless(<mekeng:gas_terminal>, [p, g, n, b, d]);
recipes.remove(<mekeng:gas_import_bus>);
recipes.addShapeless(<mekeng:gas_import_bus>, [wire, g, d]);
recipes.remove(<mekeng:gas_export_bus>);
recipes.addShapeless(<mekeng:gas_export_bus>, [wire, g, b]);
recipes.remove(<mekeng:gas_interface_part>);
recipes.addShapeless(<mekeng:gas_interface_part>, [wire, g, c, n, u]);
recipes.remove(<mekeng:gas_interface>);
recipes.addShapeless(<mekeng:gas_interface>, [f, g, c, n, u]);
recipes.remove(<mekeng:gas_storage_bus>);
recipes.addShapeless(<mekeng:gas_storage_bus>, [wire, g, b, d]);
recipes.remove(<mekeng:gas_level_emitter>);
recipes.addShapeless(<mekeng:gas_level_emitter>, [wire, g, n, r]);
recipes.remove(<mekeng:gas_interface_terminal>);
recipes.addShapeless(<mekeng:gas_interface_terminal>, [p, g, n, c, w, u]);
recipes.remove(<mekeng:gas_storage_monitor>);
recipes.addShapeless(<mekeng:gas_storage_monitor>, [p, g, n]);
recipes.remove(<mekeng:gas_conversion_monitor>);
recipes.addShapeless(<mekeng:gas_conversion_monitor>, [p, g, n, b, d]);
recipes.remove(<appliedenergistics2:material:25>);
recipes.addShaped(<appliedenergistics2:material:25>, [
    [null, <pneumaticcraft:plastic:7>, <ore:ingotGold>],
    [<pneumaticcraft:plastic:7>, <appliedenergistics2:material:23>, <ore:dustRedstone>],
    [null, <pneumaticcraft:plastic:7>, <ore:ingotGold>]
]);
recipes.remove(<appliedenergistics2:material:28>);
recipes.addShaped(<appliedenergistics2:material:28>, [
    [null, <pneumaticcraft:plastic:7>, <minecraft:diamond>],
    [<pneumaticcraft:plastic:7>, <appliedenergistics2:material:23>, <ore:dustRedstone>],
    [null, <pneumaticcraft:plastic:7>, <minecraft:diamond>]
]);
val allPlastic = <pneumaticcraft:plastic:7> | <nuclearcraft:part:6> | <mekanism:polyethene:2>;
recipes.remove(<appliedenergistics2:material:26>);
recipes.remove(<appliedenergistics2:material:52>);
recipes.addShaped(<appliedenergistics2:material:52>, [
    [<appliedenergistics2:quartz_glass>, <ore:dustGlowstone>, <appliedenergistics2:quartz_glass>],
    [<ore:dustGlowstone>, <factorytech:machinepart:130>, <ore:dustGlowstone>],
    [allPlastic, <contenttweaker:usb_module>, allPlastic]
]);
recipes.remove(<appliedenergistics2:material:39>);
recipes.addShaped(<appliedenergistics2:material:39>, [
    [<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
    [<ore:dustRedstone>, <ore:dustGlowstone>, <ore:dustRedstone>],
    [allPlastic, <contenttweaker:usb_module>, allPlastic]
]);
recipes.remove(<appliedenergistics2:molecular_assembler>);
recipes.addShapeless(<appliedenergistics2:molecular_assembler>, [f, c, <appliedenergistics2:quartz_glass>]);
recipes.remove(f);
recipes.addShaped(f * 4, [
    [<pneumaticcraft:plastic:7>, <ore:plateAluminum>, <pneumaticcraft:plastic:7>],
    [<ore:plateAluminum>, <contenttweaker:crafting_crystal>, <ore:plateAluminum>],
    [<pneumaticcraft:plastic:7>, <ore:plateAluminum>, <pneumaticcraft:plastic:7>]
]);

recipes.remove(<ae2fc:part_dual_interface>);
recipes.remove(<ae2fc:dual_interface>);
recipes.addShapeless(<ae2fc:dual_interface>, [f, i, l, c, n, u]);
recipes.addShapeless(<ae2fc:part_dual_interface>, [wire, i, l, c, n, u]);
recipes.addShapeless(<ae2fc:dual_interface>, [<appliedenergistics2:interface>, l]);
recipes.addShapeless(<ae2fc:part_dual_interface>, [<appliedenergistics2:part:440>, l]);
recipes.remove(<ae2fc:trio_interface>);
recipes.remove(<ae2fc:part_trio_interface>);
recipes.addShapeless(<ae2fc:trio_interface>, [f, i, l, g, c, n, u]);
recipes.addShapeless(<ae2fc:part_trio_interface>, [wire, i, l, g, c, n, u]);
recipes.addShapeless(<ae2fc:trio_interface>, [<ae2fc:dual_interface>, g]);
recipes.addShapeless(<ae2fc:part_trio_interface>, [<ae2fc:part_dual_interface>, g]);
recipes.addShapeless(<ae2fc:trio_interface>, [<appliedenergistics2:interface>, l, g]);
recipes.addShapeless(<ae2fc:part_trio_interface>, [<appliedenergistics2:part:440>, l, g]);

recipes.remove(<thaumicenergistics:essentia_import>);
recipes.addShapeless(<thaumicenergistics:essentia_import>, [wire, e, d]);
recipes.remove(<thaumicenergistics:essentia_export>);
recipes.addShapeless(<thaumicenergistics:essentia_export>, [wire, e, b]);
recipes.remove(<thaumicenergistics:essentia_storage>);
recipes.addShapeless(<thaumicenergistics:essentia_storage>, [wire, e, b, d]);
recipes.addShapeless(<thaumicenergistics:infusion_provider>, [f, e, n]);
recipes.addShapeless(<thaumicenergistics:arcane_assembler>, [f, e, c, <appliedenergistics2:quartz_glass>]);

recipes.remove(<bloodmagic:activation_crystal:1>);
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_1k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_4k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_16k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_64k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_1k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_4k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_16k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_64k");
recipes.removeByRecipeName("mekeng:cell/1k_cell");
recipes.removeByRecipeName("mekeng:cell/4k_cell");
recipes.removeByRecipeName("mekeng:cell/16k_cell");
recipes.removeByRecipeName("mekeng:cell/64k_cell");
recipes.removeByRecipeName("thaumicenergistics:cells/essentia_cell_1k");
recipes.removeByRecipeName("thaumicenergistics:cells/essentia_cell_4k");
recipes.removeByRecipeName("thaumicenergistics:cells/essentia_cell_16k");
recipes.removeByRecipeName("thaumicenergistics:cells/essentia_cell_64k");

recipes.remove(<astralsorcery:blockaltar>);
recipes.remove(<astralsorcery:itemwand>);
recipes.remove(<pneumaticcraft:safety_tube_module>);
recipes.addShaped(<pneumaticcraft:safety_tube_module>, [
    [null, <pneumaticcraft:pressure_gauge>, null],
    [<contenttweaker:calculation_crystal>, <pneumaticcraft:pressure_tube>, <contenttweaker:calculation_crystal>]
]);
recipes.remove(<extrautils2:scanner>);
recipes.addShapeless(<extrautils2:scanner>, [<minecraft:dropper>, <minecraft:redstone>, <contenttweaker:calculation_crystal>]);
furnace.remove(<appliedenergistics2:material:5>);
recipes.remove(<thermalexpansion:frame>);

recipes.remove(<appliedenergistics2:controller>);
recipes.addShaped(<appliedenergistics2:controller>, [
    [<sonarcore:reinforcedstoneblock>, <appliedenergistics2:material:12>, <sonarcore:reinforcedstoneblock>],
    [<appliedenergistics2:material:12>, <appliedenergistics2:material:24>, <appliedenergistics2:material:12>],
    [<sonarcore:reinforcedstoneblock>, <appliedenergistics2:material:12>, <sonarcore:reinforcedstoneblock>],
]);

recipes.remove(<appliedenergistics2:material:53>);
recipes.addShapeless(<appliedenergistics2:material:53>, [c, c, c]);

recipes.addShaped(<immersiveengineering:blueprint>.withTag({blueprint: "modules"}), [
    [null, <pneumaticcraft:printed_circuit_board>, null],
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]
]);

recipeTweak(true, <extrautils2:machine>.withTag({Type:"extrautils2:enchanter"}),[
    [<extrautils2:decorativesolidwood:1>,<extrautils2:decorativesolidwood:1>,<extrautils2:decorativesolidwood:1>],
    [<ore:ingotPlatinum>, <thermalexpansion:frame>, <ore:ingotPlatinum>],
    [<botania:manaresource:2>,<minecraft:enchanting_table>,<botania:manaresource:2>]
]);

recipeTweak(true, <botania:pylon:1>, [
    [null, <ore:nuggetTerrasteel>, null],
    [<ore:nuggetTerrasteel>, <botania:pylon:0>, <ore:nuggetTerrasteel>],
    [null, <contenttweaker:vibrant_crystal>, null]
]);

recipeTweak(true, <extrautils2:user>, [
    [<sonarcore:reinforcedstoneblock>, <ore:ingotNickel>, <sonarcore:reinforcedstoneblock>],
    [<ore:ingotNickel>, <contenttweaker:crafting_crystal>, <ore:ingotNickel>],
    [<sonarcore:reinforcedstoneblock>, <minecraft:blaze_rod>, <sonarcore:reinforcedstoneblock>]
]);

recipes.addShaped(<thaumicaugmentation:glass_tube> * 8, [
    [<thaumcraft:tube>, <thaumcraft:tube>, <thaumcraft:tube>],
    [<thaumcraft:tube>, <minecraft:glass>, <thaumcraft:tube>],
    [<thaumcraft:tube>, <thaumcraft:tube>, <thaumcraft:tube>]
]);

recipes.remove(<botania:manaresource:12>);
recipes.addShapeless(<botania:manaresource:12> * 2, [
    <botania:manaresource:16>,
    <botania:manaresource:16>,
    <botania:manaresource:8>,
    <contenttweaker:aura_crystal>,
    <minecraft:redstone_block>
]);

recipes.remove(<botania:corporeaspark>);
recipes.addShapeless(<botania:corporeaspark>, [
    <botania:spark>,
    <botania:manaresource:8>,
    <contenttweaker:aura_crystal>,
]);

recipes.remove(<botania:corporeaindex>);
recipes.addShaped(<botania:corporeaindex>, [
    [<minecraft:ender_pearl>, <minecraft:obsidian>, <minecraft:ender_pearl>],
    [<minecraft:obsidian>, <botania:corporeaspark>, <minecraft:obsidian>],
    [<botania:manaresource:9>, <minecraft:obsidian>, <botania:manaresource:9>]
]);

recipes.remove(<naturesaura:generator_limit_remover>);

recipeTweak(true, <botania:pool:3>, [
    [<astralsorcery:blockmarble>, <botania:manaresource:9>, <astralsorcery:blockmarble>],
    [<astralsorcery:blockmarble>, <astralsorcery:blockmarble>, <astralsorcery:blockmarble>]
]);

recipes.replaceAllOccurences(<factorytech:machinepart:71>, <factorytech:machinepart:72>);

recipes.remove(<thermaldynamics:duct_16:2>);
recipes.remove(<thermaldynamics:duct_32>);
recipes.addShaped(<thermaldynamics:duct_16:2> * 6, [
    [<ore:ingotInvar>, <botania:managlass>, <ore:ingotInvar>]
]);
recipes.addShaped(<thermaldynamics:duct_32> * 6, [
    [<ore:ingotTin>, <botania:managlass>, <ore:ingotTin>]
]);
recipes.remove(<enderio:item_material:22>);
recipes.addShapeless(<enderio:item_material:22> * 3, [
    <botania:manaresource:23>, <minecraft:clay_ball>, <minecraft:dye:15>
]);
recipes.remove(<enderio:item_liquid_conduit>);
recipes.addShaped(<enderio:item_liquid_conduit> * 8, [
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>],
    [<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>],
]);
recipes.remove(<enderio:item_item_conduit>);
recipes.addShaped(<enderio:item_item_conduit> * 8, [
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>],
    [<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>],
    [<enderio:item_material:4>, <enderio:item_material:4>, <enderio:item_material:4>],
]);

recipeTweak(true, <immersivecables:relay_fluix> * 8, [
    [null, <appliedenergistics2:material:12>, null],
    [<sonarcore:reinforcedstoneblock>, <appliedenergistics2:material:12>, <sonarcore:reinforcedstoneblock>],
]);

recipeTweak(true, <immersivecables:relay_fluix:1> * 8, [
    [null, <appliedenergistics2:material:7>, null],
    [<sonarcore:reinforcedstoneblock>, <appliedenergistics2:material:7>, <sonarcore:reinforcedstoneblock>],
    [<sonarcore:reinforcedstoneblock>, <appliedenergistics2:material:7>, <sonarcore:reinforcedstoneblock>],
]);

recipeTweak(false, <pneumaticcraft:regulator_tube_module>, [
    [<pneumaticcraft:pressure_tube>, <minecraft:comparator>, <minecraft:dye:4>]
]);
