#reloadable

import crafttweaker.event.BlockPlaceEvent;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityAnimal;

events.onBlockPlace(function(event as BlockPlaceEvent){
    val blockId = "botania:cocoon";
    var world = event.world;
    if(world.remote)return;
    var pos = event.position;
    if(world.getBlock(pos).definition.id==blockId){
        world.catenation().sleep(2398).run(function(world,c){
            var block = world.getBlock(pos);
            if(block.definition.id==blockId && block.data.CustomTab == {}as IData &&
                block.data.emeraldsGiven.asInt() + block.data.chorusFruitGiven.asInt() ==0 ){
                var firstUseCocoon = world.getCustomWorldData().deepGet("firstUseCocoon");
                if (isNull(firstUseCocoon) || !firstUseCocoon.asBool()) {
                    world.updateCustomWorldData(world.getCustomWorldData().deepSet(true, "firstUseCocoon"));
                    world.setBlockState(<blockstate:minecraft:air>, pos);
                    var e as IEntityAnimal = <entity:minecraft:chicken>.createEntity(world);
                    e.posX=0.5+pos.x;
                    e.posY=0.5+pos.y;
                    e.posZ=0.5+pos.z;
                    e.growingAge=-24000;
                    world.spawnEntity(e);
                }
            }
        }).start();
    }
});