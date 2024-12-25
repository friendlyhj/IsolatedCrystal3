#reloadable

import crafttweaker.data.IData;
import crafttweaker.event.PlayerLoggedInEvent;
import scripts.libs.Util;

static festivals as IData[] = [
    // [name, month, day, isLunar]
    ["元旦节", 1, 1, false],
    ["情人节", 2, 14, false],
    ["白色情人节", 3, 14, false],
    ["520", 5, 20, false],
    ["万圣节", 10, 31, false],
    ["平安夜", 12, 24, false],
    ["圣诞节", 12, 25, false],
    ["春节", 1, 1, true],
    ["元宵节", 1, 15, true],
    ["端午节", 5, 5, true],
    ["七夕节", 7, 7, true],
    ["中秋节", 8, 15, true],
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
                event.player.sendMessage(`§6§l隔壁家叔叔${festival[0]}还在玩异次元水晶，你可千万不要像他那样`);
            }
        } else {
            if (now.month + 1 == month && now.day == day) {
                event.player.sendMessage(`§6§l隔壁家叔叔${festival[0]}还在玩异次元水晶，你可千万不要像他那样`);
            }
        }
    }
});
