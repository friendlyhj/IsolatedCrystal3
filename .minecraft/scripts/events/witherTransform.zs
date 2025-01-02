#reloadable

import crafttweaker.event.EntityJoinWorldEvent;

events.onEntityJoinWorld(function(event as EntityJoinWorldEvent) {
    val entity = event.entity;
    val entityDef = entity.definition;
    if (!isNull(entityDef) && entityDef.id == "minecraft:skeleton" && entity.dimension == -1) {
        if (entity.world.remote || entity.tags has "init") {
            return;
        }
        if (entity.world.random.nextInt(5) == 0) {
            event.cancel();
            val newEntity = <entity:minecraft:wither_skeleton>.createEntity(entity.world);
            newEntity.setPosition3f(entity.position3f);
            newEntity.rotationYaw = entity.rotationYaw;
            newEntity.rotationPitch = entity.rotationPitch;
            entity.world.spawnEntity(newEntity);
        } else {
            entity.addTag("init");
        }
    }
});
