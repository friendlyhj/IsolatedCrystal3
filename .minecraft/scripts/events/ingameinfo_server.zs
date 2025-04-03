#reloadable

import crafttweaker.event.PlayerTickEvent;
import crafttweaker.world.IWorld;
import mods.zenutils.NetworkHandler;
import mods.zenutils.PlayerStat;

NetworkHandler.registerServer2ClientMessage("sync_server_info", function(player, buf) {
    if (isNull(player)) {
        return;
    }
    player.update({PlayTime: buf.readInt()});
    player.update({Mspt: buf.readDouble()});
});

events.onPlayerTick(function(event as PlayerTickEvent) {
    if (event.side != "SERVER" || event.phase != "END" || event.player.world.getWorldTime() % 20 != 0) {
        return;
    }
    NetworkHandler.sendTo("sync_server_info", event.player, function(buf) {
        buf.writeInt(event.player.readStat(PlayerStat.getBasicStat("stat.playOneMinute")));
        buf.writeDouble(getMspt(event.player.world));
    });
});

function getMspt(world as IWorld) as double {
    val history as long[] = server.native.worldTickTimes[world.dimension];
    var sum as long = 0L;
    for i in history {
        sum += i;
    }
    return 0.000001 * sum / history.length;
}
