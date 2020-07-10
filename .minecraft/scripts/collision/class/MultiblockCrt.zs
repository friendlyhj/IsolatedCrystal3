// by: youyihj
#loader crafttweaker
#priority 2499
import crafttweaker.block.IBlockState;
import scripts.collision.class.MultiblockElementCrt.newElement;
import scripts.collision.class.MultiblockElementCrt.MultiblockElement;

zenClass Multiblock {
    zenConstructor() {
    }

    var elements as MultiblockElement[string] = {};

    function addElement(name as string, block as IBlockState, pos as int[]) as Multiblock {
        this.elements[name] = newElement(block, pos);
        return this;
    }

    function getElement(name as string) as MultiblockElement {
        return this.elements[name];
    }

    function asMap() as int[][IBlockState][string] {
        var temp as int[][IBlockState][string] = {};
        for name, element in this.elements {
            temp[name] = element.asMap();
        }
        return temp;
    }
}

function newMultiblock() as Multiblock {
    return Multiblock();
}