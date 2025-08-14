#reloadable

import crafttweaker.event.PlayerTickEvent;

events.register(function(event as PlayerTickEvent) {
    if (event.phase != "START") {
        return;
    }
    val player = event.player;
    player.warpNormal = 0;
    player.warpPermanent = 0;
    player.warpTemporary = 0;
});
