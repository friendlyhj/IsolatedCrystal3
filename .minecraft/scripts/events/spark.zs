#reloadable

import mods.zenutils.event.EntityItemDeathEvent;

events.onEntityItemDeath(function(event as EntityItemDeathEvent) {
    val entityItem = event.item;
    val world = entityItem.world;
    if (event.damageSource.damageType == "inFire" && !world.remote) {
        if (<botania:manaresource:21>.matches(entityItem.item)) {
            if (<blockstate:minecraft:fire>.matchBlock().matches(world.getBlockState(entityItem.position))) {
                world.setBlockState(<blockstate:minecraft:air>, entityItem.position);
            }
            val spark = <minecraft:fire_charge>.createEntityItem(world, entityItem.posX as float, entityItem.posY as float, entityItem.posZ as float);
            spark.motionX = 0.0;
            spark.motionY = 0.0;
            spark.motionZ = 0.0;
            world.spawnEntity(spark);
        }
    }
});
