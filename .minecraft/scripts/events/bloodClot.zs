#reloadable

import crafttweaker.event.EntityLivingHurtEvent;
import crafttweaker.player.IPlayer;

events.register(function(event as EntityLivingHurtEvent) {
    if (event.entity instanceof IPlayer) {
        val player as IPlayer = event.entity;
        if (player.world.random.nextInt(10) == 1) {
            player.dropItem(<contenttweaker:blood_clot>);
        }
    }
});
