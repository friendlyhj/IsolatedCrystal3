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
    player.update({LowMspt: buf.readDouble()});
});

events.onPlayerTick(function(event as PlayerTickEvent) {
    if (event.side != "SERVER" || event.phase != "END" || event.player.world.getWorldTime() % 20 != 4) {
        return;
    }
    NetworkHandler.sendTo("sync_server_info", event.player, function(buf) {
        buf.writeInt(event.player.readStat(PlayerStat.getBasicStat("stat.playOneMinute")));
        val mspt as double[] = getMspt(event.player.world);
        buf.writeDouble(mspt[0]);
        buf.writeDouble(mspt[1]);
    });
});

function getMspt(world as IWorld) as double[] {
    var average as double = 0.0;
    var maxMs as double = 0.0;
    for dim, history in server.native.worldTickTimes {
        var sum as long = 0L;
        var max as long = 0L;
        for i in history {
            sum += i;
            if (i > max) {
                max = i;
            }
        }
        average += 0.000001 * sum / history.length;
        maxMs += 0.000001 * max;
    }
    return [average, maxMs];
}
