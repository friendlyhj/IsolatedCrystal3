#priority 220
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.player.IPlayer;
import scripts.events.event.PlayerEventSnippet.PlayerEventSnippet;
import crafttweaker.world.IWorld;

static playerTickEvents as PlayerEventSnippet[string] = {};

function registerPlayerTickEvent(event as PlayerEventSnippet) as void {
    playerTickEvents[event.name] = event;
}

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    val world as IWorld = player.world;
    for name, event in playerTickEvents {
        if (event.isServer && !world.remote) event.onRun(player);
        if (event.isClient && world.remote) event.onRun(player); 
    }
});

