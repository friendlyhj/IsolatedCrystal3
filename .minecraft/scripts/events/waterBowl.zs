#reloadable
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.block.IMaterial;

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
    val player = event.player;
    if (!<minecraft:bowl>.matches(event.item)) return;
    val rayTrace = player.getRayTrace(player.getAttribute("generic.reachDistance").attributeValue, 0.0f, true);
    if (rayTrace.isBlock) {
        if (player.world.getBlockState(rayTrace.blockPos).material.matches(IMaterial.water())) {
            // server.commandManager.executeCommandSilent(server, "playsound minecraft:item.bucket.fill neutral " ~ player.name);
            event.item.mutable().shrink(1);
            player.give(<botania:waterbowl>.withTag({Fluid: {FluidName: "water", Amount: 1000}}));
        }
    }
});
