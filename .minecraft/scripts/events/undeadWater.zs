#reloadable

import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.entity.IEntityAnimal;
import mods.fluidintetweaker.FBTweaker;

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
        val toSpawn = entity.world.random.nextBoolean() ? <entity:minecraft:zombie> : <entity:minecraft:skeleton>;
        val undead = toSpawn.createEntity(entity.world);
        undead.position3f = entity.position3f;
        undead.rotationPitch = entity.rotationPitch;
        undead.rotationYaw = entity.rotationYaw;
        entity.world.spawnEntity(undead);
    }
});

val animals as string[] = [
    "minecraft:pig",
    "minecraft:sheep",
    "minecraft:cow",
    "minecraft:rabbit",
    "minecraft:chicken",
    "minecraft:mooshroom"
];

val undeads as string[] = [
    "minecraft:zombie",
    "minecraft:skeleton"
];

for animal in animals {
    for undead in undeads {
        FBTweaker.addJEIRecipeWrapper(<liquid:undead_water>, 2, 
            FBTweaker.outputBuilder()
                .addEvent(FBTweaker.eventBuilder().createEntityConversionEvent(animal, undead).done())
                .done()
        );
    }
}
