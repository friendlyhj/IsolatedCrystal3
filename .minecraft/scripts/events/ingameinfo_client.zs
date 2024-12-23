#reloadable
#sideonly client

import native.net.minecraftforge.client.event.RenderGameOverlayEvent;
import mods.zenutils.I18n;
import mods.zenutils.StaticString;
import scripts.libs.Util;
import scripts.libs.Data;

events.register(function(event as RenderGameOverlayEvent.Text) {
    var texts = event.left;
    val date = Util.now();
    val player = client.player;
    texts += I18n.format("modpack.info.time_real", `${twoLength(date.hour)}:${twoLength(date.minute)}:${twoLength(date.second)}`);
    val playTime = Data.getInt(player.data, "PlayTime");
    texts += I18n.format("modpack.info.time_game", `${playTime / 72000}`, `${playTime / 1200 % 60}`);
    texts += StaticString.format("X: %.1f, Y: %.1f, Z: %.1f", [player.x, player.y, player.z]);
});

function twoLength(x as int) as string {
    return x < 10 ? "0" ~ x : x;
}
