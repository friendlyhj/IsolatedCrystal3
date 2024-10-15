#loader mixin

import native.com.codetaylor.mc.advancedmortars.lib.util.StackUtil;
import native.net.minecraftforge.fml.common.registry.ForgeRegistries;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraft.item.Item;
import native.net.minecraft.item.ItemStack;
import mixin.CallbackInfo;

#mixin Mixin
#{targets: "com.codetaylor.mc.advancedmortars.modules.mortar.tile.TileEntityMortarBase"}
zenClass MixinTileEntityMortarBase {
    #mixin Inject
    #{
    #   method: "incrementAndCheckDurability",
    #   at: {
    #       value: "INVOKE",
    #       target: "com/codetaylor/mc/advancedmortars/modules/mortar/tile/TileEntityMortarBase.destroy(ZZLnet/minecraft/util/SoundEvent;)Lnet/minecraft/item/ItemStack;"
    #   }
    #}
    function dropCrushedCrushed(maxDurability as int, ci as CallbackInfo) as void {
        val crushedCrushedItem = ForgeRegistries.ITEMS.getValue(ResourceLocation("contenttweaker:crushed_crushed")) as Item;
        StackUtil.spawnStackOnTop(this0.world, ItemStack(crushedCrushedItem, 2), this0.pos);
    }
}
