#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.event.WorldTickEvent;
import crafttweaker.event.ClientTickEvent;
import crafttweaker.event.BlockBreakEvent;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.block.IBlockStateMatcher;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import crafttweaker.util.Math;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.Sync;
import mods.zenutils.DataUpdateOperation;
import mods.zenutils.NetworkHandler;
import mods.randomtweaker.botania.IBotaniaFXHelper;
import scripts.libs.Vector3D;

static colors as int[string]$orderly = {
    "red": 0xb92837,
    "orange": 0xf19149,
    "yellow": 0xfff45c,
    "green": 0x32b16c,
    "cyan": 0x13b5b1,
    "blue": 0x0068b7,
    "purple": 0x66188b
};

static colorsByIndex as int[] = colors.values;

static colorOffset as int[string] = {
    "red": 0,
    "orange": 1,
    "yellow": 2,
    "green": 3,
    "cyan": 4,
    "blue": 5,
    "purple": 6
};

static coords as IBlockPos[] = [
    IBlockPos.create(-139, 131, -229),
    IBlockPos.create(-81, 131, -196),
    IBlockPos.create(-29, 131, -123),
    IBlockPos.create(-76, 131, -46),
    IBlockPos.create(-159, 131, -55),
    IBlockPos.create(-211, 131, -130),
    IBlockPos.create(-203, 131, -200)
];

static centralCoord as IBlockPos = IBlockPos.create(-140, 181, -130);

static controllerCoords as IBlockPos[] = [
    IBlockPos.create(-139, 99, -228),
    IBlockPos.create(-83, 73, -196),
    IBlockPos.create(-31, 90, -123),
    IBlockPos.create(-76, 86, -48),
    IBlockPos.create(-159, 74, -57),
    IBlockPos.create(-209, 84, -130),
    IBlockPos.create(-201, 72, -200)
];

static crystals as IItemStack[string] = {
    "red": <contenttweaker:life_crystal>,
    "orange": <contenttweaker:energy_crystal>,
    "yellow": <contenttweaker:mine_crystal>,
    "green": <contenttweaker:nature_crystal>,
    "cyan": <contenttweaker:calculation_crystal>,
    "blue": <contenttweaker:space_time_crystal>,
    "purple": <contenttweaker:perditio_crystal>
};

NetworkHandler.registerServer2ClientMessage("sync_color_info", function(player, buf) {
    val world = player.world;
    world.setCustomWorldData(world.getCustomWorldData().deepUpdate({Colors: buf.readInt()}, {Colors: DataUpdateOperation.OVERWRITE}));
});

function updateColorInfo(world as IWorld, color as string, received as bool) as void {
    var colors as int = world.getCustomWorldData().deepGetInt("Colors");
    if (received) {
        colors |= Vector3D.pow2(colorOffset[color]);
    } else {
        colors &= !Vector3D.pow2(colorOffset[color]);
    }
    world.setCustomWorldData(world.getCustomWorldData().deepUpdate({Colors: colors}, {Colors: DataUpdateOperation.OVERWRITE}));
    NetworkHandler.sendToDimension("sync_color_info", 0, function(buf) {
        buf.writeInt(colors);
    });
}

for color, item in crystals {
    RecipeBuilder.newBuilder(color, "crystal_pillar_" + color, 600)
        .addItemInput(item)
        .addStartHandler(function(event as RecipeStartEvent) {
            Sync.addSyncTask(function() {
                updateColorInfo(event.controller.world, color, true);
            });
        })
        .addFinishHandler(function(event as RecipeFinishEvent) {
            Sync.addSyncTask(function() {
                updateColorInfo(event.controller.world, color, false);
            });
        })
        .build();
}

events.onWorldTick(function(event as WorldTickEvent) {
    if (event.phase == "END") return;
    val world = event.world;
    if (world.dimension == 0) {
        val mapColors as int = world.getCustomWorldData().deepGetInt("Colors");
        // logger.logInfo("Map colors: " + mapColors);
        if (!world.remote) {
            val success = mapColors == 0x7f;
            // logger.logWarning(mapColors);
            if (success != world.getGameRuleHelper().getBoolean("doDaylightCycle")) {
                world.getGameRuleHelper().setBoolean("doDaylightCycle", success);
            }
            // tick event to transform old saves
            val transformed = world.getCustomWorldData() has "PillarTransformed";
            if (!transformed) {
                for pos in controllerCoords {
                    val block = world.getBlock(pos);
                    val blockState = world.getBlockState(pos);
                    if (block.definition.id.startsWith("modularmachinery:crystal_pillar_")) {
                        if (block.data has "owner") {
                            world.destroyBlock(pos, false);
                            world.setBlockState(
                                blockState, 
                                block.data.deepUpdate({"owner": "0"}, DataUpdateOperation.REMOVE),
                                pos
                            );
                        }
                    }
                }
                world.setCustomWorldData(world.getCustomWorldData().deepUpdate({PillarTransformed: true}, DataUpdateOperation.MERGE));
            }
        }
    }
    if (world.getGameRuleHelper().getBoolean("doMobSpawning")) {
        world.getGameRuleHelper().setBoolean("doMobSpawning", false);
    }
});

IBotaniaFXHelper.setWispFXDistanceLimit(false);

events.onClientTick(function(event as ClientTickEvent) {
    val player = client.player;
    if (isNull(player) || event.phase == "END") return;
    val world = client.player.world;
    if (world.dimension != 0) return;
    val mapColors as int = world.getCustomWorldData().deepGetInt("Colors");
    for i in 0 .. 7 {
        val colorReceived = (Vector3D.pow2(i) & mapColors) != 0;
        if (colorReceived) {
            val color = colorsByIndex[i];
            val startVec = Vector3D.fromBlockPos(coords[i]);
            val endVec = Vector3D.fromBlockPos(centralCoord);
            val r = 1.0f * (color / 0x10000) / 255.0f;
            val g = 1.0f * ((color / 0x100) & 0xff) / 255.0f;
            val b = 1.0f * (color & 0xff) / 255.0f;
            val motion = Vector3D.scale(Vector3D.subtract(endVec, startVec), 0.05);
            IBotaniaFXHelper.wispFX(startVec[0], startVec[1], startVec[2], r, g, b, 4.0f, motion[0], motion[1], motion[2], 0.7f);
        }
    }
    if (mapColors == 0x7f) {
        var startVec = Vector3D.fromBlockPos(centralCoord);
        for i in 0 .. 4 {
            val color = colorsByIndex[world.random.nextInt(7)];
            val r = 1.0f * (color / 0x10000) / 255.0f;
            val g = 1.0f * ((color / 0x100) & 0xff) / 255.0f;
            val b = 1.0f * (color & 0xff) / 255.0f;
            val offset = Vector3D.scale(Vector3D.randomUnitVector(world), 3.0);
            startVec = Vector3D.add(startVec, offset);
            IBotaniaFXHelper.wispFX(startVec[0], startVec[1], startVec[2], r, g, b, 4.0f, 0.0f, 6.0f, 0.0f);
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
        if (Math.abs(x - center.x) < 12 && Math.abs(z - center.z) < 12) {
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

events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
    var protectedArea = false;
    val x = event.x;
    val z = event.z;
    for center in coords {
        if (Math.abs(x - center.x) < 12 && Math.abs(z - center.z) < 12) {
            protectedArea = true;
            break;
        }
    }
    if (protectedArea && protectedBlocks.matches(event.blockState)) {
        event.drops = [];
    }
});

mods.chisel.Carving.removeGroup("marble");
