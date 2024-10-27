#reloadable

import crafttweaker.item.IItemStack;

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

recipes.remove(<bloodmagic:blood_rune>);
recipes.remove(<bloodmagic:sacrificial_dagger>);
recipes.remove(<bloodmagic:altar>);
recipes.remove(<bloodmagic:soul_snare>);
recipes.remove(<bloodmagic:soul_forge>);
