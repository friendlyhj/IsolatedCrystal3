#reloadable

import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.event.PlayerLeftClickBlockEvent;
import crafttweaker.item.IIngredient;
import crafttweaker.world.IBlockPos;
import scripts.libs.Vector3D;

static interfaces as IIngredient = <appliedenergistics2:interface> | <appliedenergistics2:part:440> | <ae2fc:dual_interface> | <ae2fc:part_dual_interface>;

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if (<blockstate:appliedenergistics2:cable_bus>.matchBlock().matches(event.blockState)) {
        if (interfaces.matches(event.item)) {
            event.useBlock = "DENY";
        }
    }
});

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
    val player = event.player;
    val world = player.world;
    if (<actuallyadditions:item_misc:19>.matches(event.item) && !world.remote && world.dimension == 0) {
        event.item.mutable().shrink(1);
        player.dimension = 1;
    }
});

events.onPlayerLeftClickBlock(function(event as PlayerLeftClickBlockEvent) {
    if (<blockstate:contenttweaker:crystal_log>.matchBlock().matches(event.blockState)) {
        val world = event.world;
        if (!world.remote) {
            val pos = event.position.getOffset(event.face, 1);
            val item = <botania:quartztypemana>.createEntityItem(world, 0.5f + pos.x, 0.5f + pos.y, 0.5f + pos.z);
            val vector = IBlockPos.create(0, 0, 0).getOffset(event.face, 1).asPosition3f();
            item.motionX = vector.x * 0.3;
            item.motionY = vector.y * 0.3;
            item.motionZ = vector.z * 0.3;
            world.spawnEntity(item);
        }
    }
});

<actuallyadditions:item_misc:19>.addTooltip(game.localize("modpack.tooltip.ender_star"));

<contenttweaker:iris_crystal>.modifyTooltip(function(item, tooltip, shiftPressed, advanced) {
    val formatters as string[] = ["c", "6", "e", "a", "b", "9", "d"];
    if (isNull(client)) return;
    val name = tooltip.get(0);
    val time = client.player.world.worldInfo.worldTotalTime;
    formatters.shift((time / 10) % formatters.length);
    var newName = "";
    for i in 0 .. (name.length - 2) {
        val c = name[i];
        if (c == ' ') {
            newName += c;
        } else {
            newName += "§" + formatters[i % formatters.length] + c;
        }
    }
    newName += "§r";
    tooltip.set(0, newName);
});

native.net.minecraft.block.material.Material.TNT.setNoPushMobility();
