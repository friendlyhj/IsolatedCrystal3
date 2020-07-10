// by: youyihj
#loader contenttweaker
#priority 800
import mods.contenttweaker.BlockState;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.World;
import scripts.grassUtils.EventUtilsCot as EventUtils;
import scripts.collision.class.Multiblock.Multiblock;

function multiblockMatcher(multiblock as Multiblock, world as World, coreWorldPos as BlockPos) as bool {
    for name, element in multiblock.asMap() {
        for block, pos in element {
            if (!matchBlockState(block, world.getBlockState(EventUtils.getOffset(coreWorldPos, pos[0], pos[1], pos[2])))) {
                return false;
            }
        }
    }
    return true;
}

function matchBlockState(stateID as string, stateToCompare as BlockState) as bool {
    return stateID == stateToCompare.block.definition.id;
}

// FIXME!
/* function multiblockBuilder(multiblock as Multiblock, world as World, corePos as BlockPos) {
    for name, element in multiblock.asMap() {
        for block, pos in element {
            world.setBlockState(block, EventUtils.getOffset(corePos, pos[0], pos[1], pos[2]));
        }
    }
} */