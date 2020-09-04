#priority 210
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import scripts.compatSkills.Utils.levelUp;
import scripts.compatSkills.EnumSkill.ENERGISTICS;

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    val world as IWorld = player.world;
    if (world.remote) return;
    val item as IItemStack = player.currentItem;
    // lv2
    if (!isNull(item) && item has <item:botania:manatablet> && item.tag has "mana" && item.tag.mana.asInt() != 0) levelUp(player, ENERGISTICS, 2);
});