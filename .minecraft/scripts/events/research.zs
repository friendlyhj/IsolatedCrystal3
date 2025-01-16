#reloadable

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.util.Position3f;
import mods.zenutils.DataUpdateOperation.MERGE;

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    val player = event.player;
    if (!player.data.deepGetBool("PlayerPersisted.FirstLogin")) {
        player.update(player.data.deepUpdate({PlayerPersisted: {FirstLogin: true}}, MERGE));
        server.commandManager.executeCommandSilent(server, `/thaumcraft research ${player.name} all`);
        server.commandManager.executeCommandSilent(server, `/astralsorcery research ${player.name} all`);
        player.world.catenation()
            .then(function(w, ctx) {
                player.warpNormal = 0;
                player.warpPermanent = 0;
                player.warpTemporary = 0;
                for i in 0 .. 36 {
                    player.replaceItemInInventory(i, null);
                }
            })
            .start();
        server.commandManager.executeCommandSilent(server, `/tp ${player.name} -138 68 -130`);
        player.executeCommand("/spawnpoint");
    }
});