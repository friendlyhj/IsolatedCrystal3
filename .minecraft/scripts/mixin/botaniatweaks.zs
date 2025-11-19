#loader mixin
import native.net.minecraft.block.state.IBlockState;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.init.Blocks;
import native.net.minecraft.init.Items;
import native.net.minecraftforge.fluids.FluidStack;
import native.net.minecraftforge.fluids.FluidUtil;
import native.net.minecraftforge.fluids.IFluidBlock;
import mixin.CallbackInfoReturnable;

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
