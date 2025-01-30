#reloadable

import crafttweaker.event.EntityJoinWorldEvent;

events.register(function(event as EntityJoinWorldEvent) {
    val entity = event.entity;
    val def = entity.definition;
    if (!isNull(def) && def.id == "minecraft:slime") {
        entity.update({"Botania:WorldSpawned": true});
    }
});
