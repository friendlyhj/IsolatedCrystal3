// by: youyihj
#loader crafttweaker
#priority 2500
import crafttweaker.block.IBlockState;

zenClass MultiblockElement {
    val block as IBlockState;
    val pos as int[];
    zenConstructor(blockArg as IBlockState, posArg as int[]) {
        block = blockArg;
        pos = posArg;
    }

    function asMap() as int[][IBlockState] {
        var temp as int[][IBlockState] = {};
        temp[this.block] = this.pos;
        return temp;
    }
}

function newElement(block as IBlockState, pos as int[]) as MultiblockElement {
    return MultiblockElement(block, pos);
}
