#reloadable

import native.thecodex6824.thaumicaugmentation.api.event.FluxRiftDestroyBlockEvent;
import crafttweaker.block.IBlockStateMatcher;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import crafttweaker.data.IData;
import mods.modularmachinery.MachineController;

static strongBlocks as IBlockStateMatcher =
    <blockstate:thaumicaugmentation:rift_mover_input>.matchBlock() |
    <blockstate:thaumicaugmentation:rift_mover_output>.matchBlock() |
    <blockstate:thaumicaugmentation:rift_monitor>.matchBlock() |
    <blockstate:thaumicaugmentation:rift_feeder>.matchBlock() |
    <blockstate:thaumicaugmentation:fortified_glass>.matchBlock() |
    <blockstate:thaumicaugmentation:rift_jar>.matchBlock() |
    <blockstate:thaumadditions:dawn_totem>.matchBlock();

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
        if (pos.x >= posA.x && pos.x <= posB.x && pos.y >= posA.y && pos.y <= posB.y && pos.z >= posA.z && pos.z <= posB.z) {
            event.setCanceled(true);
            return;
        }
    }
});
