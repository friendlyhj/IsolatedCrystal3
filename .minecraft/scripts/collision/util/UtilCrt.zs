// by: youyihj
#loader crafttweaker
#priority 800
import crafttweaker.block.IBlockState;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import scripts.grassUtils.EventUtils;
import scripts.collision.class.MultiblockCrt.Multiblock;

function multiblockMatcher(multiblock as Multiblock, world as IWorld, coreWorldPos as IBlockPos) as bool {
    for name, element in multiblock.asMap() {
        for block, pos in element {
            if (!matchBlockState(block, world.getBlockState(EventUtils.getOffset(coreWorldPos, pos[0], pos[1], pos[2])))) {
                return false;
            }
        }
    }
    return true;
}

function matchBlockState(state1 as IBlockState, state2 as IBlockState) as bool {
    return state1.block.definition.id == state2.block.definition.id;
}

function multiblockBuilder(multiblock as Multiblock, world as IWorld, corePos as IBlockPos) {
    for name, element in multiblock.asMap() {
        for block, pos in element {
            world.setBlockState(block, EventUtils.getOffset(corePos, pos[0], pos[1], pos[2]));
        }
    }
}