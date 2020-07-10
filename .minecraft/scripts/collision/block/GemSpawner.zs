// by: youyihj
#loader contenttweaker
#priority 240
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.BlockPos;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import scripts.grassUtils.EventUtilsCot;

static gemLib as int[IItemStack] = {
    <item:minecraft:redstone> : 1000,
    <item:minecraft:glowstone_dust> : 800,
    <item:minecraft:dye:4> : 400,
    <item:minecraft:quartz> : 400,
    <item:minecraft:diamond> : 50,
    <item:minecraft:emerald> : 50
};

static gemList as IItemStack[] = [];
static list as int[] = [];
static n as int = 0;
for key, value in gemLib {
    n += value;
    gemList += key;
    list += n;
}

val spawner as Block = VanillaFactory.createBlock("gem_spawner", <blockmaterial:iron>);
spawner.blockHardness = 10.0f;
spawner.setBlockSoundType(<soundtype:metal>);
spawner.setToolClass("pickaxe");
spawner.setToolLevel(0);
spawner.dropHandler = function(drops, world, position, state, fortune) {
    drops.clear();
};
spawner.onBlockBreak = function(world, pos, state) {
    if (!world.remote && n > 0) {
        for i in 0 .. 12 {
            var seed as int = world.getRandom().nextInt(n);
            var item as IItemStack = null;
            for j, m in list {
                if (seed < m) {
                    item = gemList[j];
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
            if (world.getBlockState(posOffset) == <block:minecraft:air>) {
                EventUtilsCot.spawnItem(world, item, posOffset);
            }
        }
    }
};
spawner.register();