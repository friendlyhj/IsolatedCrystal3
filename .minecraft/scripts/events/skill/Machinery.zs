#priority 210
import scripts.compatSkills.Utils.levelUp;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.event.PlayerTickEvent;
import scripts.compatSkills.EnumSkill.MACHINERY;
import crafttweaker.item.IItemStack;

// lv2
events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    val world as IWorld = player.world;
    if (world.remote) return;
    val item as IItemStack = player.currentItem;
    if (!isNull(item) && item has <item:botania:pistonrelay>) levelUp(player, MACHINERY, 2);
});