#priority -30
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.player.IPlayer;

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    if (player.world.remote) return;
    scripts.events.event.MachineryOne.run(player);
});

