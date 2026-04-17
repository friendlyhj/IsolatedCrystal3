#reloadable

import native.thecodex6824.thaumcraftfix.api.event.FluxRiftDestroyBlockEvent;
import crafttweaker.block.IBlockStateMatcher;
import crafttweaker.world.IBlockPos;
import crafttweaker.item.IIngredient;
import crafttweaker.world.IWorld;
import crafttweaker.data.IData;
import crafttweaker.util.IAxisAlignedBB;
import crafttweaker.world.IVector3d;
import mods.modularmachinery.MachineController;

static strongBlocks as IBlockStateMatcher =
    <blockstate:thaumicaugmentation:rift_mover_input>.matchBlock() |
    <blockstate:thaumicaugmentation:rift_mover_output>.matchBlock() |
    <blockstate:thaumicaugmentation:rift_monitor>.matchBlock() |
    <blockstate:thaumicaugmentation:rift_feeder>.matchBlock() |
    <blockstate:thaumicaugmentation:fortified_glass>.matchBlock() |
    <blockstate:thaumicaugmentation:rift_jar>.matchBlock() |
    <blockstate:thaumadditions:dawn_totem>.matchBlock() |
    <blockstate:thaumadditions:puriflower>.matchBlock() |
    <blockstate:thaumicaugmentation:fortified_glass_pane>.matchBlock();

static items as IIngredient = 
    <item:thaumicaugmentation:rift_mover_input> |
    <item:thaumicaugmentation:rift_mover_output> |
    <item:thaumicaugmentation:rift_monitor> |
    <item:thaumicaugmentation:rift_feeder> |
    <item:thaumicaugmentation:fortified_glass> |
    <item:thaumicaugmentation:rift_jar> |
    <item:thaumadditions:dawn_totem> |
    <item:thaumadditions:puriflower> |
    <item:thaumicaugmentation:fortified_glass_pane>;

events.register(function(event as FluxRiftDestroyBlockEvent) {
    val pos = event.position as IBlockPos;
    val world = event.entity.world as IWorld;
    if (strongBlocks.matches(world.getBlockState(pos))) {
        event.setCanceled(true);
        return;
    }
    val data as IData = world.getCustomWorldData().deepGet("EmptinessEnergizer");
    if (isNull(data)) {
        return;
    }
    for posData in data.asList() {
        val controller = MachineController.getControllerAt(world, posData.asBlockPos());
        if (isNull(controller) || isNull(controller.formedMachineName)) {
            continue;
        }
        val posA = controller.relativePos(-5, -1, 0);
        val posB = controller.relativePos(5, 9, 10);
        if (IAxisAlignedBB.create(posA, posB).contains(IVector3d.create(pos.x, pos.y, pos.z))) {
            event.setCanceled(true);
            return;
        }
    }
});

items.addTooltip(game.localize("isolatedcrystal.tooltip.flux_rift_guard"));
