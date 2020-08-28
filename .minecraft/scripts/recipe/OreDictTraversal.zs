#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import scripts.grassUtils.RecipeUtils.getMetalNameNew;
import scripts.grassUtils.StringHelper.toSnakeCase;
import scripts.recipe.Util.allMortarTypes;
import mods.advancedmortars.Mortar;
import mods.artisanworktables.builder.RecipeBuilder;

for entry in oreDict.entries {
    // dust
    val dustName as string = getMetalNameNew(entry, "dust");
    if (!isNull(dustName)) {
        val ingot as IOreDictEntry = oreDict.get("ingot" ~ dustName);
        if (!ingot.empty) {
            Mortar.addRecipe(allMortarTypes, entry.firstItem, 8, [ingot]);
        }
        continue;
    }
    // gear
    val gearName as string = getMetalNameNew(entry, "gear");
    if (!isNull(gearName)) {
        val plate as IOreDictEntry = oreDict.get("plate" ~ gearName);
        val rod as IOreDictEntry = oreDict.get("rod" ~ gearName);
        if (!plate.empty && !rod.empty) {
            recipes.remove(entry.firstItem);
            RecipeBuilder.get("blacksmith")
            .setName("gear_" ~ toSnakeCase(gearName))
            .setShaped([[rod, plate, rod],
                        [plate, <ore:gearStone>, plate],
                        [rod, plate, rod]])
            .addOutput(entry.firstItem)
            .addTool(<item:contenttweaker:soldering_manasteel>.marked("s"), 1)
            .setFluid(<liquid:soldering> * 72)
            .setRecipeFunction(function(out, ins, info) {
                return (ins.s.damage == 127) ? null : out;
            })
            .create();
        }
        continue;
    }
    // plate
    val plateName as string = getMetalNameNew(entry, "plate");
    if (!isNull(plateName)) {
        val ingot as IOreDictEntry = oreDict.get("ingot" ~ plateName);
        if (!ingot.empty) {
            RecipeBuilder.get("blacksmith")
            .setName("plate_" ~ toSnakeCase(plateName))
            .setShaped([[ingot]])
            .addOutput(entry.firstItem)
            .addTool(<ore:artisansHammer>, 5)
            .create();
        }
        continue;
    }
    // rod
    val rodName as string = getMetalNameNew(entry, "rod");
    if (!isNull(rodName)) {
        val ingot as IOreDictEntry = oreDict.get("ingot" ~ rodName);
        if (!ingot.empty) {
            RecipeBuilder.get("blacksmith")
            .setName("rod_" ~ toSnakeCase(rodName))
            .setShaped([[ingot]])
            .addOutput(entry.firstItem * 2)
            .addTool(<ore:artisansFile>, 5)
            .create();
        }
        continue;
    }
    // casing
    val casingName as string = getMetalNameNew(entry, "casing");
    if (!isNull(casingName)) {
        val ingot as IOreDictEntry = oreDict.get("ingot" ~ casingName);
        val plate as IOreDictEntry = oreDict.get("plate" ~ casingName);
        if (!ingot.empty && !plate.empty) {
            RecipeBuilder.get("blacksmith")
            .setName("casing_" ~ toSnakeCase(casingName))
            .setShaped([[plate, ingot, plate],
                        [ingot, null, ingot],
                        [plate, ingot, plate]])
            .addOutput(entry.firstItem * 4)
            .addTool(<ore:artisansHammer>, 10)
            .addTool(<item:contenttweaker:soldering_manasteel>.marked("s"), 2)
            .setFluid(<liquid:soldering> * 144)
            .setRecipeFunction(function(out, ins, info) {
                return (ins.s.damage >= 126) ? null : out;
            })
            .create();
        }
        continue;
    }
}