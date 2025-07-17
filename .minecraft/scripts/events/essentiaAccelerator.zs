#reloadable

import crafttweaker.event.BlockNeighborNotifyEvent;
import mods.modularmachinery.RecipeBuilder;
import mods.zenutils.DataUpdateOperation;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.Sync;
import crafttweaker.util.Math;
import native.net.minecraft.util.ITickable;
import native.org.zeith.thaumicadditions.tiles.TileAspectCombiner;

static essentiaDevices as string[] = [
    "thaumcraft:centrifuge",
    "thaumadditions:aspect_combiner",
    "thaumicaugmentation:rift_mover_input",
    "thaumicaugmentation:rift_mover_output"
];

events.onBlockNeighborNotify(function(event as BlockNeighborNotifyEvent) {
    val world = event.world;
    if (!world.remote && essentiaDevices has event.block.definition.id) {
        world.setCustomWorldData(world.getCustomWorldData().deepUpdate({
            EssentiaDevices: [
                event.position.asData()
            ]
        }, DataUpdateOperation.MERGE));
    }
});

function newRecipe(aspect1 as string, aspect2 as string, accelerate as int, time as int) as void {
    RecipeBuilder.newBuilder(`acc_${aspect1}_${aspect2}`, "essentia_accelerator", time)
        .addAspectInput(aspect1, 1)
        .addAspectInput(aspect2, 1)
        .addManaInput(1000, false)
        .addAuraInput(300)
        .addPreTickHandler(function(event as RecipeTickEvent) {
            Sync.addSyncTask(function() {
                val controller = event.controller;
                val world = controller.world;
                val centralPos = controller.relativePos(0, 0, 3);
                for posData in world.getCustomWorldData().deepGet("EssentiaDevices").asList() {
                    val pos = posData.asBlockPos();
                    if (Math.abs(pos.x - centralPos.x) > 32 || Math.abs(pos.z - centralPos.z) > 32) {
                        continue;
                    }
                    val device = world.getBlock(pos).definition.id;
                    val te = world.native.getTileEntity(pos);
                    if (essentiaDevices has device) {
                        if (device == "thaumadditions:aspect_combiner") {
                            val combiner = te as TileAspectCombiner;
                            if (!combiner.prevPowered) {
                                combiner.craftingTime = Math.min(100, combiner.craftingTime + accelerate - 1);
                            }
                        } else {
                            for i in 0 .. (accelerate - 1) {
                                (te as ITickable).update();
                            }
                        }
                    } else {
                        logger.logWarning("Removed device: " + posData.asString());
                        world.setCustomWorldData(world.getCustomWorldData().deepUpdate({
                            EssentiaDevices: [
                                pos.asData()
                            ]
                        }, {EssentiaDevices: DataUpdateOperation.REMOVE}));
                    }
                }
            });
        })
        .addRecipeTooltip(`${accelerate}x Speed`)
        .build();
}

newRecipe("fabrico", "vacuos", 4, 100);
newRecipe("permutatio", "auram", 10, 50);
newRecipe("caeles", "visum", 20, 40);
newRecipe("tempus", "draco", 50, 200);
