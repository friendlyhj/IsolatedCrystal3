#reloadable

import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.item.IIngredient;

static interfaces as IIngredient = <appliedenergistics2:interface> | <appliedenergistics2:part:440> | <ae2fc:dual_interface> | <ae2fc:part_dual_interface>;

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if (<blockstate:appliedenergistics2:cable_bus>.matchBlock().matches(event.blockState)) {
        if (interfaces.matches(event.item)) {
            event.useBlock = "DENY";
        }
    }
});
