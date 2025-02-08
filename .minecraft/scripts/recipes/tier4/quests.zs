#reloadable

import mods.zenutils.ftbq.CustomTaskEvent;

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("day_24")) {
        event.maxProgress = 24 * 20 * 60 * 20 + 18000;
        event.checkTimer = 1;
        event.enableButton = false;
        event.checker = function(player, progress) {
            return player.world.provider.getWorldTime() as int;
        };
    }
});
