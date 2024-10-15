#reloadable
#priority 2000

import crafttweaker.entity.IEntityDefinition;
import crafttweaker.entity.IEntity;
import crafttweaker.data.IData;

import crafttweaker.event.PlayerBreakSpeedEvent;
import crafttweaker.event.BlockBreakEvent;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.EntityJoinWorldEvent;

import crafttweaker.block.IBlockState;
import crafttweaker.block.IBlockStateMatcher;
import crafttweaker.block.IBlock;

import crafttweaker.item.WeightedItemStack;
import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import crafttweaker.util.IRandom;
import crafttweaker.world.IVector3d;

static Inputs as IBlockStateMatcher[] = [] as IBlockStateMatcher[];
static Outputs as WeightedItemStack[][] = [] as WeightedItemStack[][];
static PreciseResults as int[] = [] as int[];
function addRecipePrecise(outputs as WeightedItemStack[], input as IBlockStateMatcher){
    PreciseResults = PreciseResults + (Inputs.length) as int;
    Inputs += input;
    Outputs += outputs;
}
function addRecipe(outputs as WeightedItemStack[], input as IItemStack){
    Inputs += (input as IBlock).definition.getStateFromMeta(input.metadata);
    Outputs += outputs;
}

// tier1
addRecipe([<minecraft:gravel>], <minecraft:cobblestone>);
addRecipe([<minecraft:sand>], <minecraft:gravel>);
addRecipe([<contenttweaker:sand_dust>], <minecraft:sand>);
addRecipe([<minecraft:prismarine_crystals> * 4], <minecraft:prismarine>);
addRecipe([<contenttweaker:crushed_crushed> * 2], <advancedmortars:mortar:1>);
addRecipe([<contenttweaker:destruction_crystal>], <contenttweaker:destruction_matrix>);

// tier2

events.register(function(event as EntityJoinWorldEvent) {
    val entity = event.entity;
    if (entity.world.remote) return;
    val def = entity.definition;
    if (!isNull(def) && def.id == "minecraft:falling_block") {
        if (entity.nbt.Block.asString() == "contenttweaker:mana_crusher") {
            event.world.catenation()
                .repeat(2147483647, function(builder) {
                    builder.run(function(world, ctx) {
                        val posVec = IVector3d.create(entity.x, entity.y, entity.z);
                        val motionVec = posVec.add(IVector3d.create(entity.motionX, entity.motionY - 0.04, entity.motionZ));
                        val result = world.rayTraceBlocks(posVec, motionVec);
                        if (isNull(result) || !result.isBlock) {
                            return;
                        }
                        val pos = result.blockPos;
                        if (!world.isAirBlock(pos)) {
                            val state = world.getBlockState(pos);
                            for i, matcher in Inputs {
                                if (matcher.matches(state)) {
                                    world.destroyBlock(pos, false);
                                    for output in Outputs[i] {
                                        if (output.chance > world.random.nextFloat()) {
                                            world.spawnEntity(output.stack.createEntityItem(world, pos));
                                        }
                                    }
                                    // entity.motionY = entity.motionY * 0.7 + 0.1;
                                }
                            }
                        }
                    });
                })
                .stopWhen(function(world, ctx) {
                    return !entity.native.addedToWorld || !entity.alive || entity.y < 0;
                })
                .start();
        }
    }
});
