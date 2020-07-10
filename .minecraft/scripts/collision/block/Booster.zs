// by: youyihj
#loader contenttweaker
#priority 297
#ikwid
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Part;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.PartType;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.Color;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.BlockPos;
import crafttweaker.oredict.IOreDict;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import scripts.grassUtils.StringHelperCot as StringHelper;
import scripts.grassUtils.EventUtilsCot;

/* static oreListFix as BlockState[string] = {
    "iron" : <block:minecraft:iron_ore>,
    "gold" : <block:minecraft:gold_ore>,
    "copper" : <block:thermalfoundation:ore>,
    "tin" : <block:thermalfoundation:ore:1>,
    "silver" : <block:thermalfoundation:ore:2>,
    "lead" : <block:thermalfoundation:ore:3>,
    "aluminium" : <block:thermalfoundation:ore:4>,
    "nickel" : <block:thermalfoundation:ore:5>,
    "platinum" : <block:thermalfoundation:6>,
    "iridium" : <block:thermalfoundation:7>,
    "osmium" : <block:mekanism:oreblock>
}; */

val boosterType as PartType = MaterialSystem.createPartType("booster", function(materialPart) {
    val block as Block = VanillaFactory.createBlock("booster_" ~ materialPart.getMaterial().getName().toLowerCase(), <blockmaterial:rock>);
    block.blockHardness = 2.0f;
    block.blockResistance = 50;
    block.blockSoundType = <soundtype:stone>;
    block.toolClass = "pickaxe";
    block.toolLevel = 0;
    block.gravity = true;
    block.onUpdateTick = function(world, pos, state) {
        if (!world.remote) {
            var type as string = state.block.definition.id.split("_")[1];
            if (type == "aluminium") type = "aluminum";
            val air as BlockState = <block:minecraft:air>;
            var blockAround as BlockState[] = [air, air, air, air];
            var codeAround as byte[] = [0, 0, 0, 0];
            val offsets as BlockPos[] = [
                pos.getOffset("north", 1),
                pos.getOffset("south", 1),
                pos.getOffset("west", 1),
                pos.getOffset("east", 1)
            ];
            for i, offset in offsets {
                blockAround[i] = world.getBlockState(offset);
                if (blockAround[i] == <block:contenttweaker:proton>) {
                    codeAround[i] = 1;
                } else if (blockAround[i] == <block:contenttweaker:neutron>) {
                    codeAround[i] = 2;
                }
            }
            var n1 as int = 0;
            var n2 as int = 0;
            for code in codeAround {
                if (code == 1) {
                    n1 += 1;
                } else if (code == 2) {
                    n2 += 1;
                }
            }
            if (n1 == 2 && n2 == 2) {
                for i, block in blockAround{
                    if (block == <block:contenttweaker:proton>) {
                        world.setBlockState(<block:contenttweaker:proton_empty>, offsets[i]);
                    } else if (block == <block:contenttweaker:neutron>) {
                        world.setBlockState(<block:contenttweaker:neutron_empty>, offsets[i]);
                    }
                }
                val worldCrt as IWorld = world;
                val item as IItemStack = oreDict.get("ore" ~ StringHelper.toUpperCamelCase(type)).firstItem;
                if (!isNull(item)) {
                    val id as string = item.definition.id;
                    if (item.definition.owner == "minecraft") {
                        worldCrt.setBlockState(IBlockState.getBlockState(id, []), pos);
                    } else {
                        worldCrt.setBlockState(IBlockState.getBlockState(id, ["type=" ~ type]), pos);
                    }
                }
            }
        }
    };
    block.textureLocation = mods.contenttweaker.ResourceLocation.create("contenttweaker:blocks/booster");
    block.itemColorSupplier = function(item, tintIndex) as Color {
        return Color.fromInt(MaterialSystem.getMaterial(item.definition.id.split("_")[1][0].toUpperCase() ~ item.definition.id.split("_")[1].substring(1)).getColor());
    };
    block.blockColorSupplier = function(state, access, pos, tintIndex) as Color {
        return Color.fromInt(MaterialSystem.getMaterial(state.block.definition.id.split("_")[1][0].toUpperCase() ~ state.block.definition.id.split("_")[1].substring(1)).getColor());
    };
    block.register();
});

val boosterPart as Part = MaterialSystem.getPartBuilder().setName("booster").setPartType(boosterType).setOreDictName("booster").build();

boosterPart.registerToMaterials(scripts.collision.item.Nucleus.materialList.values);