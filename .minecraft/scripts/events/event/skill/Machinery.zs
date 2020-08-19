#priority 210
import scripts.events.event.PlayerEventSnippet.PlayerEventSnippet;
import scripts.compatSkills.Utils.levelUp;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.event.PlayerTickEvent;
import scripts.compatSkills.EnumSkill.MACHINERY;
import crafttweaker.item.IItemStack;

/* val machineryLv2 as PlayerEventSnippet = PlayerEventSnippet("machinery_lv2", true, false);
machineryLv2.onRun = function(player as IPlayer) as void {
    val item as IItemStack = player.currentItem;
    if (!isNull(item) && item has <item:botania:pistonrelay>) levelUp(player, MACHINERY, 2);
};
registerPlayerTickEvent(machineryLv2); */

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    val world as IWorld = player.world;
    if (world.remote) return;
    val item as IItemStack = player.currentItem;
    if (!isNull(item) && item has <item:botania:pistonrelay>) levelUp(player, MACHINERY, 2);
});