import mods.botaniatweaks.Agglomeration;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.AgglomerationMultiblock;

Agglomeration.addRecipe(
    AgglomerationRecipe.create()
        .inputs(
            <contenttweaker:crafting_crystal>,
            <pneumaticcraft:printed_circuit_board>,
            <appliedenergistics2:material:22>,
            <appliedenergistics2:material:23>,
            <appliedenergistics2:material:24>,
            <factorytech:machinepart:90>,
            <factorytech:machinepart:100>,
            <factorytech:machinepart:110>,
            <factorytech:machinepart:120>
        )
        .output(<contenttweaker:logic_crystal>)
        .color1(0xffffff)
        .color2(0x72ffde)
        .manaCost(125000)
        .multiblock(
            AgglomerationMultiblock.create()
                .center(<appliedenergistics2:controller>)
                .edge(<minecraft:redstone_block>)
                .corner(<extrautils2:redstonelantern:15>)
                .edgeReplace(<minecraft:coal_block>)
                .cornerReplace(<extrautils2:redstonelantern>)
        )
);
