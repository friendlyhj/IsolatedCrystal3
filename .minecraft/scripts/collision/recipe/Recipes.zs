#loader crafttweaker

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemDefinition;
import scripts.grassUtils.RecipeUtils.createFull3;
import scripts.grassUtils.RecipeUtils.createFull2;
import scripts.grassUtils.RecipeUtils.getMetalNameNew;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;

val p as IItemStack = <item:contenttweaker:proton>;
val n as IItemStack = <item:contenttweaker:neutron>;

n.definition.setContainerItem(<item:contenttweaker:neutron_empty>.definition);
p.definition.setContainerItem(<item:contenttweaker:proton_empty>.definition);

recipes.addShaped("refined_proton", <contenttweaker:proton_refined>, [
    [null,p,null],
    [p,<contenttweaker:proton_empty_refined>,p],
    [null,p,null]
]);

recipes.addShaped("refined_neutron", <contenttweaker:neutron_refined>, [
    [null,n,null],
    [n,<contenttweaker:neutron_empty_refined>,n],
    [null,n,null]
]);

recipes.addShaped("metal_spawner", <contenttweaker:metal_spawner>, [
    [<ore:cobblestone>, <contenttweaker:metal_chunk>, <ore:cobblestone>],
    [<contenttweaker:metal_chunk>, <contenttweaker:plank_wood>, <contenttweaker:metal_chunk>],
    [<ore:cobblestone>, <contenttweaker:metal_chunk>, <ore:cobblestone>]
]);

recipes.addShaped("gem_spawner", <contenttweaker:gem_spawner>, [
    [<contenttweaker:plank_wood>, <contenttweaker:mystical_gem>, <contenttweaker:plank_wood>],
    [<contenttweaker:mystical_gem>, <ore:ingotIron>, <contenttweaker:mystical_gem>],
    [<contenttweaker:plank_wood>, <contenttweaker:mystical_gem>, <contenttweaker:plank_wood>]
]);

recipes.addShapeless("bone_plank", <contenttweaker:plank_wood>, [
    <ore:plankWood>, <minecraft:dye:15>, <minecraft:dye:15>, <minecraft:dye:15>
]);

recipes.addShaped("ghast_tear", <minecraft:ghast_tear>, createFull3(<item:contenttweaker:little_ghast_drop>));

recipes.addShaped("wither_altar", <contenttweaker:wither_altar>, [
    [<minecraft:bone_block>, <actuallyadditions:block_crystal:3>, <minecraft:bone_block>],
    [<actuallyadditions:block_crystal_empowered:3>, <actuallyadditions:block_crystal:2>, <actuallyadditions:block_crystal_empowered:3>],
    [<minecraft:bone_block>, <actuallyadditions:block_crystal:3>, <minecraft:bone_block>]
]);

recipes.addShaped("wither_wand", <contenttweaker:wither_altar_wand>, [
    [null, null, <ore:itemSkull>],
    [null, <actuallyadditions:item_phantom_connector>, null],
    [<actuallyadditions:block_crystal_empowered:4>, null, null]
]);

recipes.addShaped("pe", <contenttweaker:proton_empty>, [
    [<contenttweaker:plank_wood>, <ore:stone>, <contenttweaker:plank_wood>],
    [<ore:sand>, <ore:coal>, <ore:sand>],
    [<contenttweaker:plank_wood>, <ore:stone>, <contenttweaker:plank_wood>]
]);

recipes.addShaped("ne", <contenttweaker:neutron_empty>, [
    [<contenttweaker:plank_wood>, <ore:stone>, <contenttweaker:plank_wood>],
    [<ore:gravel>, <ore:coal>, <ore:gravel>],
    [<contenttweaker:plank_wood>, <ore:stone>, <contenttweaker:plank_wood>]
]);

recipes.addShaped("pef", <contenttweaker:proton_empty_refined>, createFull2(<contenttweaker:proton_empty>));
recipes.addShaped("nef", <contenttweaker:neutron_empty_refined>, createFull2(<contenttweaker:neutron_empty>));

recipes.addShaped("collider_lv1", <contenttweaker:collider_lv1>, [
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
    [n, <ore:plankWood>, p],
    [<ore:plankWood>,<ore:plankWood>, <ore:plankWood>]
]);

recipes.addShaped("collider_lv2", <contenttweaker:collider_lv2>, [
    [<contenttweaker:plank_wood>, <contenttweaker:plank_wood>, <contenttweaker:plank_wood>],
    [n, <contenttweaker:plank_wood>, p],
    [<contenttweaker:plank_wood>,<contenttweaker:plank_wood>, <contenttweaker:plank_wood>]
]);

recipes.addShaped("collider_lv3", <contenttweaker:collider_lv3>, [
    [<ore:ingotIron>, <ore:ingotCopper>, <ore:ingotIron>],
    [<contenttweaker:proton_refined>, <ore:ingotGold>,<contenttweaker:neutron_refined>],
    [<ore:ingotIron>, <ore:ingotCopper>, <ore:ingotIron>]
]);

recipes.addShaped("starter", <contenttweaker:collider_starter>, [
    [null, <ore:cobblestone>, <ore:string>],
    [null, <ore:stickWood>, <ore:cobblestone>],
    [<ore:stickWood>, null, null]
]);

val nuggets as IIngredient = <ore:nuggetIron> | <ore:nuggetCopper> | <ore:nuggetAluminium> | <ore:nuggetLead> | <ore:nuggetNickel> | <ore:nuggetTin>;
for entry in oreDict.entries {
    val type as string = getMetalNameNew(entry, "booster");
    if (!isNull(type)) {
        var nugget as IItemStack = oreDict.get("nugget" ~ type).firstItem;
        if (type.contains("alum")) nugget = <item:thermalfoundation:material:196>;
        val nucleus as IOreDictEntry = oreDict.get("nucleus" ~ type);
        furnace.addRecipe(nugget * 3, nucleus);
        recipes.addShaped("booster_" ~ type, entry.firstItem, [
            [null, nuggets, null],
            [<ore:cobblestone>, nucleus, <ore:cobblestone>],
            [null, nuggets, null]
        ]);
    }
}