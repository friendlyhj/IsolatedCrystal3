// by: youyihj
#loader contenttweaker
#priority 2500

zenClass MultiblockElement {
    val block as string;
    val pos as int[];
    zenConstructor(blockArg as string, posArg as int[]) {
        block = blockArg;
        pos = posArg;
    }

    function asMap() as int[][string] {
        var temp as int[][string] = {};
        temp[this.block] = this.pos;
        return temp;
    }
}

function newElement(block as string, pos as int[]) as MultiblockElement {
    return MultiblockElement(block, pos);
}
