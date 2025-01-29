#reloadable

import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.item.IIngredient;

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

<actuallyadditions:item_misc:19>.addTooltip(game.localize("modpack.tooltip.ender_star"));
