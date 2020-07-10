// by: youyihj
#loader crafttweaker
import crafttweaker.events.IEventManager;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.world.IBlockPos;
import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.world.IWorld;
import scripts.grassUtils.EventUtils;

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
    val entity as IEntityLivingBase = event.entityLivingBase;
    val type as string = event.damageSource.damageType;
    val world as IWorld = entity.world;
    val id as string = entity.definition.id;
    if (!world.remote && (type == "fallingBlock" || type == "inWall")) {
        print("a mob die in wall!");
        val originalPos as IBlockPos = entity.position3f.asBlockPos();
        for x in 0 .. 3 {
            for y in 0 .. 3 {
                for z in 0 .. 3 {
                    val pos as IBlockPos = EventUtils.getOffset(originalPos, x - 1, y - 1, z - 2);
                    if (world.getBlockState(pos).matches(<blockstate:minecraft:sand>)) {
                        world.setBlockState(<blockstate:minecraft:soul_sand>, pos);
                    }
                }
            }
        }
    }
});
