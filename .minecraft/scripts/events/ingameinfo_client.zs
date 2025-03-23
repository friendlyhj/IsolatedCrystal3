#reloadable
#sideonly client

import crafttweaker.event.RenderTickEvent;
import crafttweaker.util.Math;
import mods.zenutils.EventPriority;
import mods.zenutils.I18n;
import mods.zenutils.StaticString;
import scripts.libs.Util;
import scripts.libs.Data;
import native.net.minecraft.client.Minecraft;
import native.net.minecraft.client.gui.ScaledResolution;
import native.net.minecraft.client.renderer.OpenGlHelper;

events.onRenderTick(function(event as RenderTickEvent) {
    if (event.phase != "END") {
        return;
    }
    val mc = Minecraft.getMinecraft();
    if (isNull(mc.currentScreen)) {
        val date = Util.now();
        val player = client.player;
        val res = ScaledResolution(mc);
        val width as int = res.scaledWidth;
        val height as int = res.scaledHeight;
        val playTime = Data.getInt(player.data, "PlayTime");
        val mspt = Data.getDouble(player.data, "Mspt");
        var msptBar as string = null;
        var barColor as string = null;
        if (mspt < 50) {
            barColor = "§a";
            if (mspt > 40) {
                barColor = "§c";
            } else if (mspt > 25) {
                barColor = "§6";
            }
            val usedBarCount = Math.ceil(mspt / 2.5);
            msptBar = `MSPT:[${barColor}${StaticString.repeat("|", "", usedBarCount)}§7${StaticString.repeat("|", "", 20 - usedBarCount)}§r] ${StaticString.format("%s%.2f", [barColor, mspt])}ms   `;
        } else {
            val tps = Math.min(20.0, 1000.0 / mspt);
            barColor = "§a";
            if (tps < 18) {
                barColor = "§c";
            } else if (tps < 15) {
                barColor = "§6";
            }
            msptBar = StaticString.format("TPS: %s%.2f", [barColor, tps]);
        }
        val fontRender = mc.fontRenderer;
        val textHeight = fontRender.FONT_HEIGHT;
        OpenGlHelper.glBlendFunc(0x302, 0x303, 1, 0);
        val texts as string[] = [
            I18n.format("modpack.info.time_real", `${twoLength(date.hour)}:${twoLength(date.minute)}:${twoLength(date.second)}`),
            I18n.format("modpack.info.time_game", [playTime / 72000, playTime / 1200 % 60]),
            StaticString.format("X: %.1f, Y: %.1f, Z: %.1f", [player.x, player.y, player.z]),
            msptBar
        ];
        var top = height - 2 - textHeight * texts.length;
        for text in texts {
            fontRender.drawStringWithShadow(text, width - 2 - fontRender.getStringWidth(text), top, 0x00bfff);
            top += textHeight;
        }
    }
});

function twoLength(x as int) as string {
    return x < 10 ? "0" ~ x : x;
}
