// by: youyihj
#loader crafttweaker
#priority 500
#ignoreBracketErrors
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerAttackEntityEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.util.Position3f;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import scripts.grassUtils.EventUtils;

import scripts.collision.class.MultiblockCrt.Multiblock;
import scripts.collision.class.MultiblockCrt.newMultiblock;
import scripts.collision.util.UtilCrt as Util;

static bone as IBlockState = <blockstate:minecraft:bone_block>;
static witherAltar as Multiblock = newMultiblock()
.addElement("core", <blockstate:contenttweaker:wither_altar>, [0,0,0])
.addElement("one", bone, [1,0,0])
.addElement("two", bone, [-1,0,0])
.addElement("three", bone, [0,0,-1])
.addElement("four", bone, [0,0,1]);
for i in 0 .. 3 {
    for j in 0 .. 3 {
        witherAltar.addElement("bottom" ~ i ~ j, bone, [i - 1, -1, j - 1]);
    }
}

static air as IBlockState = <blockstate:minecraft:air>;
static witherAltarClear as Multiblock = newMultiblock()
.addElement("core", air, [0,0,0])
.addElement("one", air, [1,0,0])
.addElement("two", air, [-1,0,0])
.addElement("three", air, [0,0,-1])
.addElement("four", air, [0,0,1]);
for i in 0 .. 3 {
    for j in 0 .. 3 {
        witherAltarClear.addElement("bottom" ~ i ~ j, air, [i - 1, -1, j - 1]);
    }
}

events.onPlayerAttackEntity(function(event as PlayerAttackEntityEvent) {
    val player as IPlayer = event.player;
    val world as IWorld = player.world;
    val entity as IEntity = event.target;
    val main as IEntityEquipmentSlot = IEntityEquipmentSlot.mainHand();
    if (!world.remote && player.hasItemInSlot(main) && player.getItemInSlot(main).definition.id == "contenttweaker:wither_altar_wand" && entity instanceof IEntityLivingBase && !entity instanceof IPlayer) {
        val mob as IEntityLivingBase = entity;
        if (mob.alive && mob.health < 4.0f) {
            mob.health = 0.0f;
            val wand as IItemStack = player.getItemInSlot(main);
            if (wand.hasTag) {
                val data as IData = wand.tag;
                val pos as IBlockPos = Position3f.create(data.AltarPosX.asInt(), data.AltarPosY.asInt(), data.AltarPosZ.asInt()).asBlockPos();
                /* print(pos.x);
                print(pos.y);
                print(pos.z); */
                if (Util.multiblockMatcher(witherAltar, world, pos)) {
                    print("Bingo!");
                    world.newExplosion(player, pos.x + 0.5f, pos.y, pos.z + 0.5f, 0.5f, true, false);
                    Util.multiblockBuilder(witherAltarClear, world, pos);
                    var n as int = 0;
                    for x in 0 .. 5 {
                        for z in 0 .. 5 {
                            val posSkull as IBlockPos = EventUtils.getOffset(pos, x - 2, -1, z - 2);
                            if (Util.matchBlockState(<blockstate:minecraft:skull>, world.getBlockState(posSkull))) {
                                n += 1;
                                world.setBlockState(<blockstate:minecraft:air>, posSkull);
                            }
                        }
                    }
                    if (n > 0) {
                        EventUtils.spawnItem(world, <item:minecraft:skull:1> * n, pos);
                    }
                }
            }
        }
    }
});