#priority 210
import scripts.events.event.PlayerEventSnippet.PlayerEventSnippet;
import crafttweaker.event.PlayerTickEvent;
import scripts.compatSkills.Utils.levelUp;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import scripts.compatSkills.EnumSkill.BOTANY;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityEquipmentSlot;

/* val botanyLv2 as PlayerEventSnippet = PlayerEventSnippet("botany_lv2", true, false);
botanyLv2.onRun = function(player as IPlayer) as void {
    val mainItem as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.mainHand());
    val offItem as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.offhand());
    val redFlower as IItemStack = <item:minecraft:red_flower>;
    val yellowFlower as IItemStack = <item:minecraft:yellow_flower>;
    if (!isNull(mainItem) && !isNull(offItem) && (mainItem has redFlower && offItem has yellowFlower) || (mainItem has yellowFlower && offItem has redFlower)) {
        levelUp(player, BOTANY, 2);
    }
};
registerPlayerTickEvent(botanyLv2); */

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    val world as IWorld = player.world;
    if (world.remote) return;
    val mainItem as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.mainHand());
    val offItem as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.offhand());
    val redFlower as IItemStack = <item:minecraft:red_flower>;
    val yellowFlower as IItemStack = <item:minecraft:yellow_flower>;
    if (isNull(mainItem) || isNull(offItem)) return;
    if ((mainItem has redFlower && offItem has yellowFlower) || (mainItem has yellowFlower && offItem has redFlower)) {
        levelUp(player, BOTANY, 2);
    }
});