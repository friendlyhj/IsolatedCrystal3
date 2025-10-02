#reloadable

import mods.randomtweaker.botania.PoolTradeEvent;

events.onPoolTrade(function(event as PoolTradeEvent) {
    val input = event.input;
    if (event.alchemy && <ore:cobblestone>.matches(input.item)) {
        if (event.world.dimension != -1) {
            event.setOutput(<chisel:cobblestone>.withTag({
                "failed": true
            }));
        } else {
            event.setOutput(<minecraft:netherrack>);
        }
    }
});

<chisel:cobblestone>.withTag({"failed": true}).addTooltip(game.localize("modpack.tooltip.netherrack_fail.0"));
<chisel:cobblestone>.withTag({"failed": true}).addTooltip(game.localize("modpack.tooltip.netherrack_fail.1"));
