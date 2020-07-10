// by: youyihj
#loader contenttweaker
#priority 2499
import scripts.collision.class.MultiblockElement.newElement;
import scripts.collision.class.MultiblockElement.MultiblockElement;

zenClass Multiblock {
    zenConstructor() {
    }

    var elements as MultiblockElement[string] = {};

    function addElement(name as string, block as string, pos as int[]) as Multiblock {
        this.elements[name] = newElement(block, pos);
        return this;
    }

    function getElement(name as string) as MultiblockElement {
        return this.elements[name];
    }

    function asMap() as int[][string][string] {
        var temp as int[][string][string] = {};
        for name, element in this.elements {
            temp[name] = element.asMap();
        }
        return temp;
    }
}

function newMultiblock() as Multiblock {
    return Multiblock();
}