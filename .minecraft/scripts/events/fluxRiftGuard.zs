#reloadable

import native.thecodex6824.thaumcraftfix.api.event.FluxRiftDestroyBlockEvent;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import crafttweaker.data.IData;
import mods.modularmachinery.MachineController;

events.register(function(event as FluxRiftDestroyBlockEvent) {
    val pos = event.position as IBlockPos;
    val world = event.entity.world as IWorld;
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
