// by: youyihj
#loader contenttweaker
#priority 240
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.BlockPos;
import crafttweaker.data.IData;
import scripts.grassUtils.EventUtilsCot;
import crafttweaker.oredict.IOreDict;

static metalList as string[] = [];
static list as int[] = [];
static n as int = 0;
for key, value in scripts.collision.data.OreArray.oreList {
    n += value[1];
    metalList += key;
    list += n;
}

val spawner as Block = VanillaFactory.createBlock("metal_spawner", <blockmaterial:iron>);
spawner.blockHardness = 10.0f;
spawner.setBlockSoundType(<soundtype:metal>);
spawner.setToolClass("pickaxe");
spawner.setToolLevel(0);
spawner.dropHandler = function(drops, world, position, state, fortune) {
    drops.clear();
};
spawner.onBlockBreak = function(world, pos, state) {
    if (!world.remote && n > 0) {
        for i in 0 .. 24 {
            var seed as int = world.getRandom().nextInt(n);
            var type as string = null;
            for j, m in list {
                if (seed < m) {
                    type = metalList[j];
                    break;
                }
            }
            var vector as int[] = [2, 2, 2];
            while (vector[0] == 2 && vector[1] == 2 && vector[2] == 2) {
                for j in 0 .. 3 {
                    vector[j] = world.getRandom().nextInt(5);
                }
            }
            var posOffset as BlockPos = EventUtilsCot.getOffset(pos, vector[0] - 2, vector[1] - 2, vector[2] - 2);
            if (!isNull(type) && world.getBlockState(posOffset) == <block:minecraft:air>) {
                if (!oreDict.get("nucleus" ~ type).empty) {
                    EventUtilsCot.spawnItem(world, oreDict.get("nucleus" ~ type).firstItem, posOffset);
                }
            }
        }
    }
};
spawner.register();