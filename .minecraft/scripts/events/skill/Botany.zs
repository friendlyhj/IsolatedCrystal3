#priority 210
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import scripts.compatSkills.Utils.levelUp;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import scripts.compatSkills.EnumSkill.BOTANY;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityEquipmentSlot;
import mods.ctutils.utils.Math;

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    val world as IWorld = player.world;
    if (world.remote) return;
    val mainItem as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.mainHand());
    val offItem as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.offhand());

    // lv2
    val redFlower as IItemStack = <item:minecraft:red_flower>;
    val yellowFlower as IItemStack = <item:minecraft:yellow_flower>;
    if (isNull(mainItem)) return;
    if (!isNull(offItem) && ((mainItem has redFlower && offItem has yellowFlower) || (mainItem has yellowFlower && offItem has redFlower))) {
        levelUp(player, BOTANY, 2);
        return;
    }

    // lv3
    if (mainItem.definition.id == "botania:specialflower" && mainItem.tag has "type" && mainItem.tag.type == "puredaisy") {
        levelUp(player, BOTANY, 3);
        return;
    }
});

// lv4
events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if (event.world.remote || isNull(event.player.currentItem)) return;
    if (event.player.currentItem.definition.id == "botania:twigwand" && Math.random() < 0.05) levelUp(event.player, BOTANY, 4);
});
