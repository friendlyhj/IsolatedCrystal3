#reloadable

import crafttweaker.event.BlockNeighborNotifyEvent;

events.onBlockNeighborNotify(function(event as BlockNeighborNotifyEvent) {
    if (<blockstate:contenttweaker:crystal_alga_crops>.matchBlock().matches(event.blockState)) {
        val down = event.world.getBlockState(event.position.down());
        if (!(<blockstate:emergingtechnology:hydroponic>.matchBlock().matches(down))) {
            event.world.destroyBlock(event.position, true);
        }
    } 
});
