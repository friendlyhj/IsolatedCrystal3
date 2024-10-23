#reloadable

import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.entity.IEntityAnimal;

events.register(function(event as EntityLivingUpdateEvent) {
    val entity = event.entityLivingBase;
    val world = entity.world;
    if (entity instanceof IEntityAnimal && !world.remote && world.time % 20 == 0) {
        if (<blockstate:contenttweaker:undead_water>.matchBlock().matches(world.getBlockState(entity.position))) {
            event.entityLivingBase.attackEntityFrom(<damageSource:undead_water>, 2.0f);
        }
    }
});

events.register(function(event as EntityLivingDeathEvent) {
    if (event.damageSource.damageType == "undead_water") {
        val entity = event.entityLivingBase;
        val zombie = <entity:minecraft:zombie>.createEntity(entity.world);
        zombie.position3f = entity.position3f;
        zombie.rotationPitch = entity.rotationPitch;
        zombie.rotationYaw = entity.rotationYaw;
        entity.world.spawnEntity(zombie);
    }
});
