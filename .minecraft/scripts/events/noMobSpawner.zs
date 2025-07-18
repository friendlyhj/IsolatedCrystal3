#reloadable

import crafttweaker.event.EntityLivingExtendedSpawnEvent;

events.register(function(event as EntityLivingExtendedSpawnEvent) {
    if (isNull(event.spawner)) {
        return;
    }
    if (<blockstate:minecraft:mob_spawner>.matchBlock().matches(event.world.getBlockState(event.spawner.blockPos))) {
        event.deny();
    }
});
