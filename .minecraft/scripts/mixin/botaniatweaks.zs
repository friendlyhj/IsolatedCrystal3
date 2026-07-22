#loader mixin
import native.net.minecraft.block.state.IBlockState;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.init.Blocks;
import native.net.minecraft.init.Items;
import native.net.minecraftforge.fluids.FluidStack;
import native.net.minecraftforge.fluids.FluidUtil;
import native.net.minecraftforge.fluids.IFluidBlock;
import native.vazkii.botania.api.subtile.SubTileGenerating;
import mixin.CallbackInfo;
import mixin.CallbackInfoReturnable;
import scripts.mixin.shared.Op;

import native.top.outlands.foundation.boot.ActualClassLoader;
import native.net.minecraft.launchwrapper.Launch;

// Fixes the display of fluid block in JEI, showing the bucket item

#mixin Mixin
#{targets: "quaternary.botaniatweaks.modules.shared.helper.MiscHelpers"}
zenClass MixinMiscHelpers {
    #mixin Static
    #mixin Inject
    #{
    #   method: "stackFromState",
    #   at: {value: "HEAD"},
    #   cancellable: true
    #}
    function fixFluidDisplay(state as IBlockState, cir as CallbackInfoReturnable) as void {
        if (isNull(state)) return;
        val block = state.block;
        if (block == Blocks.WATER) {
            cir.setReturnValue(ItemStack(Items.WATER_BUCKET));
        } else if (block == Blocks.LAVA) {
            cir.setReturnValue(ItemStack(Items.LAVA_BUCKET));
        } else if (block instanceof IFluidBlock) {
            cir.setReturnValue(FluidUtil.getFilledBucket(FluidStack((block as IFluidBlock).fluid, 1000)));
        }
    }
}

// Allows the agglomeration multiblock to accept air as a valid block pattern.

#mixin Mixin
#{targets: "quaternary.botaniatweaks.modules.crafttweaker.CTAgglomeration"}
zenClass MixinCTAgglomerationMultiblock {
    #mixin Static
    #mixin Redirect
    #{
    #   method: "toMinecraftBlockstate",
    #   at: {
    #       value: "INVOKE",
    #       target: "net/minecraft/item/ItemStack.func_190926_b()Z"
    #   }
    #}
    function allowAir(item as ItemStack) as bool {
        return false;
    }
}

#mixin Mixin
#{targets: "quaternary.botaniatweaks.asm.BotaniaTweakerHooks"}
zenClass MixinBotaniaTweakerHooks {
    #mixin Static
    #mixin Inject {method: "beforeFlowerReturn", at: {value: "INVOKE", target: "quaternary/botaniatweaks/modules/botania/wsd/ManaStatisticsWsd.trackMana(Ljava/lang/String;I)V"}}
    #mixin Local {parameter: -1, name: "manaDifference"}
    function trackMana(flowerName as string, flower as SubTileGenerating, newMana as int, ci as CallbackInfo, manaDifference as int) as void {
        if (!isNull(Op.trackMana)) {
            Op.trackMana(flowerName, manaDifference, flower);
        }
    }
}

(Launch.classLoader as ActualClassLoader).removeTransformerExclusion("quaternary.botaniatweaks.asm");

