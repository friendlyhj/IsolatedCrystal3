#loader mixin

import native.ink.ikx.rt.impl.mods.botania.event.PoolTradeEvent;
import native.net.minecraft.entity.item.EntityItem;
import native.net.minecraft.item.ItemStack;
import native.vazkii.botania.api.recipe.RecipeManaInfusion;
import mixin.CallbackInfoReturnable;

#mixin {targets: "com.aeternal.botaniverse.blocks.tiles.TileMorePool"}
zenClass MixinTileMorePool {

    #mixin Inject{method: "collideEntityItem", at = {value: "INVOKE", target: "Lvazkii/botania/api/recipe/RecipeManaInfusion;getManaToConsume()I", shift: "AFTER"}, locals: "CAPTURE_FAILHARD", cancellable: true}
    function injectCollideEntityItem(item as EntityItem, cir as CallbackInfoReturnable, stack as ItemStack, recipe as RecipeManaInfusion) as void {
        var mana = recipe.manaToConsume;
        var world = this0.world;
        var pos = this0.pos;
        val event = PoolTradeEvent(mana, this0.currentMana, recipe.output.copy(), item, recipe.alchemy, recipe.conjuration, world, pos);
        if (!event.post()) {
            if (event.mana > this0.currentMana && !event.allowExceed) {
                cir.setReturnValue(false);
                return;
            }
            this0.recieveMana(-event.mana as int);
            stack.shrink(1);
            var outputItem = EntityItem(world, pos.x + 0.5, pos.y + 1.5, pos.z + 0.5, event.output);
            outputItem.age = 105;
            world.spawnEntity(outputItem);
            this0.craftingFanciness();
            cir.setReturnValue(true);
        }
        cir.setReturnValue(false);
    }
}
