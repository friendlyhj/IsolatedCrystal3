// by: youyihj
#loader crafttweaker
import crafttweaker.events.IEventManager;
import crafttweaker.event.BlockHarvestDropsEvent;

events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
    if (event.blockState == <blockstate:contenttweaker:metal_spawner> && event.silkTouch) {
        event.drops = [];
    }
});