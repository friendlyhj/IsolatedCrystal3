#reloadable
#priority 2147483647
import mods.artisanworktables.builder.RecipeBuilder;
import crafttweaker.world.IBlockPos;

function getArtisanRecipeBuilder(type as string) as RecipeBuilder {
    return RecipeBuilder.get(type);
}

$expand IBlockPos$offset(pos as IBlockPos) as IBlockPos {
    return this.add(pos.x, pos.y, pos.z);
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
