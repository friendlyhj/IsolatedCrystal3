#reloadable

import crafttweaker.event.BlockHarvestDropsEvent;

events.register(function(event as BlockHarvestDropsEvent) {
    if (<ore:treeLeaves>.matches(event.block.getItem(event.world, event.position, event.blockState))) {
        event.addItem(<contenttweaker:jade_leaf> % 5);
    }
});

<entity:thaumcraft:wisp>.clearDrops();
