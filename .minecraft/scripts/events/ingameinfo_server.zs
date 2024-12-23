#reloadable

import crafttweaker.event.PlayerTickEvent;
import mods.zenutils.NetworkHandler;
import mods.zenutils.PlayerStat;

NetworkHandler.registerServer2ClientMessage("sync_play_time", function(player, buf) {
    player.update({PlayTime: buf.readInt()});
});

events.onPlayerTick(function(event as PlayerTickEvent) {
    if (event.side != "SERVER" || event.phase != "END" || event.player.world.getWorldTime() % 20 != 0) {
        return;
    }
    NetworkHandler.sendTo("sync_play_time", event.player, function(buf) {
        buf.writeInt(event.player.readStat(PlayerStat.getBasicStat("stat.playOneMinute")));
    });
});