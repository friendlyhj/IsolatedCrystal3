#reloadable

import scripts.recipes.lib.ArtisanRecipeBuilder as RecipeBuilder;

RecipeBuilder.get("chef")
    .setShapeless([<ore:meatRaw>])
    .addTool(<ore:artisansRazor>, 2)
    .addOutput(<contenttweaker:blood_clot>)
    .setExtraOutputOne(<minecraft:bone>, 0.25)
    .create();

RecipeBuilder.get("chef")
    .setShapeless([<minecraft:pumpkin>, <contenttweaker:blood_clot>])
    .addTool(<ore:artisansCarver>, 5)
    .addOutput(<botania:felpumpkin>)
    .setRecipeFunction(function(out, ins, info) {
        val player = info.player;
        if (!isNull(player) && !player.fake && player.health > 8.0f) {
            return out;
        } else {
            return null;
        }
    })
    .setRecipeAction(function(out, info, player) {
        player.attackEntityFrom(<damageSource:MAGIC>, 8.0f);
    })
    .create();

RecipeBuilder.get("chef")
    .setShaped([
        [null, <ore:meatRaw>, null],
        [<ore:meatRaw>, <contenttweaker:blood_clot>, <ore:meatRaw>],
        [null, <ore:meatRaw>, null]])
    .setFluid(<liquid:blood> * 160)
    .addTool(<ore:artisansBeaker>, 20)
    .addOutput(<contenttweaker:flesh_crystal>)
    .create();
