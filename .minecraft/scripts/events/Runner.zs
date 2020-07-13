#priority 2200
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.player.IPlayer;
import scripts.events.event.PlayerEventSnippet.PlayerEventSnippet;

static playerTickEvents as PlayerEventSnippet[string] = {};

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    if (player.world.remote) return;
    //scripts.events.event.MachineryOne.run(player);
});

