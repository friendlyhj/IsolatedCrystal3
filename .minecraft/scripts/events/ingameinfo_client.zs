#reloadable
#sideonly client

import crafttweaker.event.RenderTickEvent;
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
        val fontRender = mc.fontRenderer;
        val textHeight = fontRender.FONT_HEIGHT;
        OpenGlHelper.glBlendFunc(0x302, 0x303, 1, 0);
        val texts as string[] = [
            I18n.format("modpack.info.time_real", `${twoLength(date.hour)}:${twoLength(date.minute)}:${twoLength(date.second)}`),
            I18n.format("modpack.info.time_game", [playTime / 72000, playTime / 1200 % 60]),
            StaticString.format("X: %.1f, Y: %.1f, Z: %.1f", [player.x, player.y, player.z])
        ];
        var top = height - 2 - textHeight * texts.length;
        for text in texts {
            fontRender.drawString(text, width - 2 - fontRender.getStringWidth(text), top, 0xe0e0e0);
            top += textHeight;
        }
    }
});

function twoLength(x as int) as string {
    return x < 10 ? "0" ~ x : x;
}
