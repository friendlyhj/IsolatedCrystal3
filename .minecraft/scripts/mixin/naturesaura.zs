#loader mixin

import native.net.minecraft.world.World;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.block.state.IBlockState;
import native.net.minecraft.util.EnumFacing;
import native.net.minecraft.block.properties.PropertyInteger;
import native.de.ellpeck.naturesaura.blocks.BlockGoldenLeaves;
import native.net.minecraft.block.BlockLeaves;
import native.net.minecraft.entity.Entity;
import native.net.minecraft.entity.item.EntityMinecart;
import native.net.minecraftforge.common.util.ITeleporter;
import native.java.lang.Integer;
import native.java.util.Random;

#mixin {targets: "de.ellpeck.naturesaura.blocks.BlockGoldenLeaves"}
zenClass MixinBlockGoldenLeaves extends BlockLeaves {
    #mixin Shadow
    static STAGE as PropertyInteger;
    
    // updateTick
    #mixin Overwrite
    function func_180650_b(world as World, pos as BlockPos, state as IBlockState, rand as Random) as void {
        super.updateTick(world, pos, state, rand);
        if (!world.isRemote) {
            val stage = (state.getValue(STAGE) as Integer) as int;
            if (stage < 3) {
                world.setBlockState(pos, state.withProperty(STAGE, 3 as Integer));
            } 
            if (stage > 1) {
                for i in 0 .. 3 {
                    val offset = pos.offset(EnumFacing.random(rand));
                    if (world.isBlockLoaded(offset)) {
                        BlockGoldenLeaves.convert(world, offset);
                    }
                }
            }
        }
    }
}

#mixin {targets: "de.ellpeck.naturesaura.api.NaturesAuraAPI"}
zenClass MixinNaturesAuraAPI {
    #mixin Static
    #mixin ModifyConstant{method: <clinit>, constant: {intValue: 12513828}}
    function changeOverworldAuraColor(value as int) as int {
        return 0xb0a0ff;
    }
}
