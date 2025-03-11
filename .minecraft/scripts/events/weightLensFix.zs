#reloadable

import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.entity.IEntityItem;
import crafttweaker.item.IIngredient;

static metaRemoveBlocks as IIngredient = <minecraft:lapis_ore:*> | <appliedenergistics2:charged_quartz_ore:*>;

events.onEntityJoinWorld(function(event as EntityJoinWorldEvent) {
    val entity = event.entity;
    if (entity instanceof IEntityItem) {
        val entityItem as IEntityItem = entity;
        val item = entityItem.item;
        if (metaRemoveBlocks.matches(item)) {
            item.mutable().withDamage(0);
        }
    }
});
