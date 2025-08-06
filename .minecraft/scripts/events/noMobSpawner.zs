#reloadable

import crafttweaker.event.EntityLivingExtendedSpawnEvent;
import crafttweaker.event.PlayerInteractBlockEvent;

events.register(function(event as EntityLivingExtendedSpawnEvent) {
    if (isNull(event.spawner)) {
        return;
    }
    if (<blockstate:minecraft:mob_spawner>.matchBlock().matches(event.world.getBlockState(event.spawner.blockPos))) {
        event.deny();
    }
});

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if (<blockstate:minecraft:mob_spawner>.matchBlock().matches(event.blockState)) {
        event.useBlock = "DENY";
        event.useItem = "DENY";
    }
});
