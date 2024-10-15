#reloadable

import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.item.IIngredient;
import crafttweaker.entity.IEntityItem;

static invulnerableItems as IIngredient = 
    <contenttweaker:blazing_spark> |
    <contenttweaker:heated_crystal> |
    <minecraft:gunpowder> |
    <minecraft:fire_charge>;

events.register(function(event as EntityJoinWorldEvent) {
    val entity = event.entity;
    if (entity instanceof IEntityItem) {
        val entityItem as IEntityItem = entity;
        if (invulnerableItems.matches(entityItem.item)) {
            entityItem.isInvulnerable = true;
        }
    }
});
