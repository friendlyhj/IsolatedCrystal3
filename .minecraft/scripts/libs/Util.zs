#reloadable
#priority 2147483647
import mods.artisanworktables.builder.RecipeBuilder;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import mods.modularmachinery.IMachineController;
import mods.ctintegration.date.IDate;

static basicAspects as string[] = [
    "aer",
    "terra",
    'ignis',
    "aqua",
    "ordo",
    "perditio"
];

function getArtisanRecipeBuilder(type as string) as RecipeBuilder {
    return RecipeBuilder.get(type);
}

function now() as IDate {
    return IDate.getInstance();
}

$expand IBlockPos$rotateYNorthUntil(facing as IFacing) as IBlockPos {
    var current as IFacing = north;
    var rot = this;
    while (current != facing) {
        current = facing.rotateY();
        rot = IBlockPos.create(-rot.getZ(), rot.getY(), rot.getX());
    }
    return rot;
}

$expand IBlockPos$offset(pos as IBlockPos) as IBlockPos {
    return this.add(pos.x, pos.y, pos.z);
}

$expand IMachineController$relativePos(x as int, y as int, z as int) as IBlockPos {
    return this.pos.offset(this.rotateWithControllerFacing(IBlockPos.create(x, y, z)));
}

function toLowerCamelCase(arg as string) as string {
    if (arg.contains("_")) { //snake case
        var splitResult as string[] = arg.split("_");
        var temp as string = "";
        for i, j in splitResult {
            if (i == 0) {
                temp ~= j;
            } else if (i >= 1) {
                temp ~= (j[0].toUpperCase() ~ j.substring(1)); 
            }
        }
        return temp;
    } else if (arg[0].toLowerCase() != arg[0]) { //upper camel case
        return arg[0].toLowerCase() ~ arg.substring(1);
    } else return arg; //lower camel case or invalid case
}

function toUpperCamelCase(arg as string) as string {
    if (arg.contains("_")) { //snake case
        var splitResult as string[] = arg.split("_");
        var temp as string = "";
        for i, j in splitResult {
            temp ~= (j[0].toUpperCase() ~ j.substring(1));
        }
        return temp;
    } else if (arg[0].toUpperCase() != arg[0]) { //lower camel case
        return arg[0].toUpperCase() ~ arg.substring(1);
    } else return arg; //upper camel case or invalid case
}

function toSnakeCase(arg as string) as string {
    if (arg.contains("_")) { //snake case
        return arg;
    } else { //camel case
        var temp as string = arg[0];
        for i in 1 .. arg.length {
            if (arg[i].toLowerCase() != arg[i]) {
                temp ~= "_";
            }
            temp ~= arg[i];
        }
        return temp.toLowerCase();
    }
}
