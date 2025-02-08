#reloadable

import crafttweaker.data.IData;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.text.ITextComponent;
import scripts.libs.Util;

static festivals as IData[] = [
    // [name, month, day, isLunar]
    ["new_year", 1, 1, false],
    ["valentine", 2, 14, false],
    ["white_valentine", 3, 14, false],
    ["520", 5, 20, false],
    ["halloween", 10, 31, false],
    ["christmas_eve", 12, 24, false],
    ["christmas", 12, 25, false],
    ["new_year_chinese", 1, 1, true],
    ["lantern", 1, 15, true],
    ["loong_boat", 5, 5, true],
    ["qixi", 7, 7, true],
    ["mid_autumn", 8, 15, true],
];

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    val now = Util.now();
    val lunar = Util.chineseLunar(now);
    for festival in festivals {
        val month = festival[1].asInt();
        val day = festival[2].asInt();
        val isLunar = festival[3].asBool();
        if (isLunar) {
            if (lunar.month == month && lunar.day == day && !lunar.leapMonth.asBool()) {
                event.player.sendRichTextMessage(
                    ITextComponent.fromTranslation("modpack.festival", ITextComponent.fromTranslation("modpack.festival." ~ festival[0]))
                );
                return;
            }
        } else {
            if (now.month + 1 == month && now.day == day) {
                event.player.sendRichTextMessage(
                    ITextComponent.fromTranslation("modpack.festival", ITextComponent.fromTranslation("modpack.festival." ~ festival[0]))
                );
                return;
            }
        }
    }
});
