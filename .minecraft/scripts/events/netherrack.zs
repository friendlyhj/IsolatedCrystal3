#reloadable

import mods.randomtweaker.botania.PoolTradeEvent;

events.onPoolTrade(function(event as PoolTradeEvent) {
    val input = event.input;
    if (event.alchemy && <ore:cobblestone>.matches(input.item) && event.world.dimension != -1) {
        event.setOutput(<chisel:cobblestone>);
    }
});