#loader mixin

import native.java.util.Random;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.world.IBlockAccess;
import mixin.CallbackInfoReturnable;

#mixin {targets: "sonar.calculator.mod.common.block.CalculatorLeaves"}
zenClass MixinCalculatorLeaves {
    #mixin Inject{method: "func_149745_a", at: {value: "HEAD"}, cancellable: true}
    function alwaysDrop(rng as Random, cir as CallbackInfoReturnable) as void {
        cir.setReturnValue(1);
    }

    #mixin Overwrite
    function isShearable(item as ItemStack, world as IBlockAccess, pos as BlockPos) as bool {
        return false;
    }
}
