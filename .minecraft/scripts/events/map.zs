#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.event.WorldTickEvent;
import crafttweaker.event.BlockBreakEvent;
import crafttweaker.block.IBlockStateMatcher;
import crafttweaker.util.Math;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.Sync;
import mods.zenutils.DataUpdateOperation;

val colors as int[string] = {
    "red": 0xb92837,
    "orange": 0xf19149,
    "yellow": 0xfff45c,
    "green": 0x32b16c,
    "cyan": 0x13b5b1,
    "blue": 0x0068b7,
    "purple": 0x66188b
};

val colorOffset as int[string] = {
    "red": 0,
    "orange": 1,
    "yellow": 2,
    "green": 3,
    "cyan": 4,
    "blue": 5,
    "purple": 6
};

val coords as double[][] = [
    [-139, 131, -229],
    [-81, 131, -196],
    [-29, 131, -123],
    [-76, 131, -46],
    [-159, 131, -55],
    [-211, 131, -130],
    [-203, 131, -200]
];

val crystals as IItemStack[string] = {
    "red": <contenttweaker:life_crystal>,
    "orange": <contenttweaker:energy_crystal>,
    "yellow": <contenttweaker:mine_crystal>,
    "green": <contenttweaker:nature_crystal>,
    "cyan": <contenttweaker:calculation_crystal>,
    "blue": <contenttweaker:space_time_crystal>,
    "purple": <contenttweaker:perditio_crystal>
};

for color, item in crystals {
    RecipeBuilder.newBuilder(color, "crystal_pillar_" + color, 600)
        .addItemInput(item)
        .addStartHandler(function(event as RecipeStartEvent) {
            Sync.addSyncTask(function() {
                val world = event.controller.world;
                var mapColors = world.getCustomWorldData().Colors;
                if (isNull(mapColors)) {
                    mapColors = byteArrayOf(7);
                }
                mapColors.asByteArray()[colorOffset[color]] = 1;
                world.setCustomWorldData(world.getCustomWorldData().deepUpdate({Colors: mapColors}, {Colors: DataUpdateOperation.OVERWRITE}));
            });
        })
        .addFinishHandler(function(event as RecipeFinishEvent) {
            Sync.addSyncTask(function() {
                val world = event.controller.world;
                var mapColors = world.getCustomWorldData().Colors;
                if (isNull(mapColors)) {
                    mapColors = byteArrayOf(7);
                }
                mapColors.asByteArray()[colorOffset[color]] = 0;
                world.setCustomWorldData(world.getCustomWorldData().deepUpdate({Colors: mapColors}, {Colors: DataUpdateOperation.OVERWRITE}));
            });
        })
        .build();
}

events.onWorldTick(function(event as WorldTickEvent) {
    if (event.phase == "END") return;
    val world = event.world;
    if (world.remote) return;
    if (world.dimension == 0) {
        val mapColors = world.getCustomWorldData().Colors;
        var success = true;
        if (isNull(mapColors)) {
            success = false;
        } else {
            for flag in mapColors.asByteArray() {
                if (flag != 1) {
                    success = false;
                    break;
                }
            }
        }
        if (success != world.getGameRuleHelper().getBoolean("doDaylightCycle")) {
            world.getGameRuleHelper().setBoolean("doDaylightCycle", success);
        }
    } else {
        if (world.getGameRuleHelper().getBoolean("doDaylightCycle")) {
            world.getGameRuleHelper().setBoolean("doDaylightCycle", false);
        }
    }
});

for color in colors {
    val block = <item:modularmachinery:crystal_pillar_${color}_controller>.asBlock().definition;
    block.hardness = -1.0f;
    block.resistance = 6000.0f;
}

<item:chisel:marble>.asBlock().definition.hardness = -1.0f;
<item:chisel:marble>.asBlock().definition.resistance = 6000.0f;
<item:chisel:marblepillar>.asBlock().definition.hardness = -1.0f;
<item:chisel:marblepillar>.asBlock().definition.resistance = 6000.0f;

static protectedBlocks as IBlockStateMatcher = 
    <blockstate:minecraft:beacon> |
    <blockstate:botania:quartztypemana:variant=normal> |
    <blockstate:minecraft:stone_slab:variant=quartz,half=top> |
    <blockstate:minecraft:quartz_stairs>.matchBlock() |
    <blockstate:minecraft:iron_door>.matchBlock() |
    <blockstate:minecraft:iron_trapdoor>.matchBlock() |
    <blockstate:minecraft:double_stone_slab:variant=quartz> |
    <blockstate:modularmachinery:blockinputbus:size=tiny>;

events.onBlockBreak(function(event as BlockBreakEvent) {
    var protectedArea = false;
    val x = event.x;
    val z = event.z;
    for center in coords {
        if (Math.abs(x - center[0]) < 12 && Math.abs(z - center[2]) < 12) {
            protectedArea = true;
            break;
        }
    }
    if (protectedArea && protectedBlocks.matches(event.blockState)) {
        if (event.isPlayer && event.player.creative) {
            return;
        } else {
            event.cancel();
        }
    }
});
