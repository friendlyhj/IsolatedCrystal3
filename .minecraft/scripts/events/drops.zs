#reloadable

import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.block.IMaterial;

static modIdBlacklist as string[] = [
    "contenttweaker",
    "calculator",
    "naturesaura"
];

events.register(function(event as BlockHarvestDropsEvent) {
    val block = event.blockState;
    if (IMaterial.leaves().matches(block.material) && !(modIdBlacklist has block.block.definition.id.split(":")[0])) {
        event.addItem(<contenttweaker:jade_leaf> % 5);
    }
});

<entity:thaumcraft:wisp>.clearDrops();
