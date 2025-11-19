#loader mixin

import native.java.util.Random;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.world.IBlockAccess;
import native.net.minecraft.world.World;
import native.net.minecraft.block.state.IBlockState;
import mixin.CallbackInfoReturnable;

// Makes Calculator Leaves always drop itself, although not using shears
// This aims to allow Drum of the Canopy to collect them

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

// Denies Crystal Alga to be planted in Calculator Greenhouse

#mixin {targets: "sonar.core.handlers.planting.vanilla.VanillaFertiliser"}
zenClass MixinVanillaFertiliser {
    #mixin Inject{method: "canFertilise", at: {value: "HEAD"}, cancellable: true}
    function denyCrystalAlga(world as World, pos as BlockPos, state as IBlockState, cir as CallbackInfoReturnable) as void {
        if (state.block.registryName.toString() == "contenttweaker:crystal_alga_crops") {
            cir.setReturnValue(false);
        }
    }
}

#mixin {targets: "sonar.core.handlers.planting.vanilla.VanillaHarvester"}
zenClass MixinVanillaHarvester {
    #mixin Inject{method: "canHarvest", at: {value: "HEAD"}, cancellable: true}
    function denyCrystalAlga(world as World, pos as BlockPos, state as IBlockState, cir as CallbackInfoReturnable) as void {
        if (state.block.registryName.toString() == "contenttweaker:crystal_alga_crops") {
            cir.setReturnValue(false);
        }
    }
}

#mixin {targets: "sonar.core.handlers.planting.vanilla.VanillaPlanter"}
zenClass MixinVanillaPlanter {
    #mixin Inject{method: "isPlantable", at: {value: "HEAD"}, cancellable: true}
    function denyCrystalAlga(seed as ItemStack, cir as CallbackInfoReturnable) as void {
        if (seed.item.registryName.toString() == "contenttweaker:crystal_alga_seeds") {
            cir.setReturnValue(false);
        }
    }
}
