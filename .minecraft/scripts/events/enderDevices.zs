#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.data.IData;
import crafttweaker.event.BlockNeighborNotifyEvent;
import crafttweaker.event.WorldTickEvent;
import crafttweaker.event.PlayerRightClickItemEvent;
import mods.zenutils.I18n;
import mods.zenutils.DataUpdateOperation;

static enderDevices as int[][IItemStack] = {
    // name: [aura consumption, ignore meta]
    <enderstorage:ender_storage:0>: [50, 0],
    <enderstorage:ender_storage:1>: [50, 0],
    <mekanism:machineblock3>: [100, 0],
    <enderio:block_normal_wireless_charger>: [40, 1],
    <enderio:block_enhanced_wireless_charger:0>: [40, 1],
    <enderio:block_wireless_charger_extension:0>: [10, 1],
    <enderio:block_transceiver>: [100, 1],
    <enderio:block_travel_anchor>: [10, 1],
    <actuallyadditions:block_laser_relay>: [20, 1],
    <actuallyadditions:block_laser_relay_advanced>: [30, 1],
    <actuallyadditions:block_laser_relay_extreme>: [40, 1],
    <actuallyadditions:block_laser_relay_fluids>: [40, 1],
    <actuallyadditions:block_laser_relay_item>: [40, 1],
    <actuallyadditions:block_laser_relay_item_whitelist>: [40, 1],
    <actuallyadditions:block_ranged_collector>: [10, 1],
    <bloodmagic:teleposer>: [150, 1],
    <bloodmagic:master_routing_node>: [10, 1],
    <bloodmagic:input_routing_node>: [10, 1],
    <bloodmagic:output_routing_node>: [10, 1],
    <bloodmagic:item_routing_node>: [10, 1],
    <actuallyadditions:block_phantomface>: [80, 1],
    <actuallyadditions:block_phantom_placer>: [80, 1],
    <actuallyadditions:block_phantom_liquiface>: [80, 1],
    <actuallyadditions:block_phantom_energyface>: [80, 1],
    <actuallyadditions:block_phantom_redstoneface>: [80, 1],
    <fluxnetworks:fluxplug>: [90, 1],
    <fluxnetworks:fluxpoint>: [90, 1],
    <fluxnetworks:fluxcontroller>: [90, 1],
    <appliedenergistics2:spatial_pylon>: [4, 1],
    <appliedenergistics2:spatial_io_port>: [100, 1],
    <appliedenergistics2:quantum_ring>: [10, 1],
    <appliedenergistics2:quantum_link>: [120, 1],
    <thaumcraft:essentia_input>: [15, 1],
    <thaumcraft:essentia_output>: [15, 1],
    <thaumicaugmentation:impetus_relay>: [20, 1],
    <modularrouters:item_router>: [75, 1],
    <extrautils2:interactionproxy>: [75, 1],
    <extrautils2:playerchest>: [50, 1],
    <draconicevolution:energy_crystal>: [10, 0],
    <draconicevolution:energy_crystal:1>: [15, 0],
    <draconicevolution:energy_crystal:2>: [20, 0],
    <draconicevolution:energy_crystal:3>: [10, 0],
    <draconicevolution:energy_crystal:4>: [15, 0],
    <draconicevolution:energy_crystal:5>: [20, 0],
    <draconicevolution:energy_crystal:6>: [40, 0],
    <draconicevolution:energy_crystal:7>: [45, 0],
    <draconicevolution:energy_crystal:8>: [50, 0]
};

static enderDevicesMatchingMap as int[string] = {};

for item, info in enderDevices {
    var key = item.definition.id;
    if (info[1] == 0) {
        key ~= ":";
        key ~= item.metadata;
    }
    enderDevicesMatchingMap[key] = info[0];
    item.addTooltip(I18n.format("modpack.tooltip.aura_consume", [info[0]]));
}

events.onBlockNeighborNotify(function(event as BlockNeighborNotifyEvent) {
    val world = event.world;
    val block = event.block;
    if (world.remote) return;
    if (event.blockState.material.matches(air)) return;
    val item = itemUtils.getItem(block.definition.id, block.meta);
    var isEnderDevice = false;
    var matchingMeta = false;
    for device, info in enderDevices {
        if (device.matches(item)) {
            isEnderDevice = true;
            matchingMeta = (info[1] == 0);
            break;
        }
    }
    if (isEnderDevice) {
        var key = item.definition.id;
        if (matchingMeta) {
            key ~= ":";
            key ~= item.metadata;
        }
        world.setCustomWorldData(world.getCustomWorldData().deepUpdate({
            EnderDevices: {
                `${key}`: [
                    event.position.asData()
                ]
            }
        }, DataUpdateOperation.MERGE));
        logger.logWarning(world.getCustomWorldData().asString());
    }
});

events.onWorldTick(function(event as WorldTickEvent) {
    if (event.phase == "END") return;
    val world = event.world;
    if (world.remote) return;
    val enderDevicesData as IData = world.getCustomWorldData().EnderDevices;
    if (isNull(enderDevicesData)) return;
    for name, poses in enderDevicesData.asMap() {
        val auraConsumption = enderDevicesMatchingMap[name];
        if (isNull(auraConsumption)) {
            continue;
        }
        val matchingMeta = name.split(":").length == 3;
        var invalidPoses as IData[] = [];
        for posData in poses.asList() {
            val pos as IBlockPos = posData.asBlockPos();
            if (world.isBlockLoaded(pos)) {
                val block = world.getBlock(pos);
                var blockName = block.definition.id;
                if (matchingMeta) {
                    blockName ~= ":";
                    blockName ~= block.meta;
                }
                if (name == blockName) {
                    print("drain " ~ auraConsumption);
                    world.getAuraChunk(pos).drainAura(pos, auraConsumption);
                } else {
                    print("invalid");
                    invalidPoses += posData;
                }
            }
            if (invalidPoses.length != 0) {
                world.setCustomWorldData(world.getCustomWorldData().deepUpdate({
                    EnderDevices: {
                        `${name}`: IData.createDataList(invalidPoses)
                    }
                }, {
                    EnderDevices: {
                        `${name}`: DataUpdateOperation.REMOVE
                    }
                }));
            }
        }
    }
});

events.register(function(event as PlayerRightClickItemEvent) {
    if (!event.world.remote && <naturesaura:eye>.matches(event.item)) {
        event.player.sendMessage(event.world.getAuraInArea(event.position, 10));
    }
});
