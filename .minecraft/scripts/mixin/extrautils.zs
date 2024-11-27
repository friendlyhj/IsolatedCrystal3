#loader mixin

import native.net.minecraft.util.EnumFacing;
import native.net.minecraft.world.World;
import native.net.minecraft.util.math.BlockPos;
import native.com.google.common.collect.Lists;

#mixin {targets: "com.rwtema.extrautils2.tile.TileAdvInteractor"}
zenClass MixinTileAdvInteractor {
    #mixin Redirect{method: "onNeighborBlockChange", at: {value: "INVOKE", target: "net/minecraft/world/World.func_175687_A(Lnet/minecraft/util/math/BlockPos;)I"}}
    function denyFacingRedstone(world as World, pos as BlockPos) as int {
        val facings  = [
            EnumFacing.UP,
            EnumFacing.DOWN,
            EnumFacing.NORTH,
            EnumFacing.SOUTH,
            EnumFacing.WEST,
            EnumFacing.EAST
        ] as [EnumFacing];
        var state = world.getBlockState(pos);
        for property, value in state.properties {
            if (value instanceof EnumFacing) {
                facings.remove(value);
                break;
            }
        }
        var power as int = 0;
        for facing in facings {
            var sidePower = world.getRedstonePower(pos.offset(facing), facing);
            if (sidePower >= 15) {
                return 15;
            } else {
                power = max(power, sidePower);
            }
        }
        return power;
    }
}

