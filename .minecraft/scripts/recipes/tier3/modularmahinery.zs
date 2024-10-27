#reloadable

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeEvent;
import crafttweaker.world.IBlockPos;
import crafttweaker.data.IData;
import mods.zenutils.StringList;
import scripts.libs.Util.basicAspects;
import native.thaumcraft.common.entities.EntityFluxRift;
import native.kport.modularmagic.common.tile.TileAspectProvider;

RecipeBuilder.newBuilder("perditio_crystal", "emptiness_energizer", 120)
    // .addImpetusInput(20)
    .addItemInputs(<contenttweaker:warp_crystal>, <thaumcraft:ingot:1> * 4, <thaumicaugmentation:material:5> * 2, <thaumadditions:mithminite_nugget>)
    .addItemOutput(<contenttweaker:perditio_crystal>)
    .addStartHandler(function(event as RecipeStartEvent) {
        val order = intArrayOf(6);
        val stringList = StringList.create([0, 1, 2, 3, 4, 5]);
        stringList.shuffle();
        for index, id in stringList {
            order[index] = id;
        }
        event.controller.customData = {"Order": order};
    })
    .addPreTickHandler(function(event as RecipeTickEvent) {
        val controller = event.controller;
        val pos = controller.pos;
        val world = controller.world;
        if (event.activeRecipe.tick % 10 == 0) {
            val posA as IBlockPos = pos.offset(controller.rotateWithControllerFacing(IBlockPos.create(-5, 0, 0)));
            val posB as IBlockPos = pos.offset(controller.rotateWithControllerFacing(IBlockPos.create(5, 10, 10)));
            var success as bool = false;
            for entity in world.getEntitiesInArea(posA, posB) {
                if (entity.native instanceof EntityFluxRift) {
                    val rift = entity.native as EntityFluxRift;
                    if (rift.riftSize >= 100) {
                        success = true;
                        return;
                    }
                }
            }
            if (!success) {
                event.preventProgressing("no 100 size rift");
            }
        }
        if (event.activeRecipe.tick % 20 == 1) {
            val requireAspectId as int = controller.customData.Order[event.activeRecipe.tick / 20].asInt();
            val requireAspectName as string = basicAspects[requireAspectId];
            val aspectInputBus = world.native.getTileEntity(pos.offset(controller.rotateWithControllerFacing(IBlockPos.create(0, 0, 10)))) as TileAspectProvider;
            if (aspectInputBus.aspect == null) {
                event.preventProgressing("Requires aspect: " ~ requireAspectName);
                world.setBlockState(<blockstate:extrautils2:redstonelantern>.withProperty("power", requireAspectId + 1), pos.up(8));
            } else if (aspectInputBus.aspect.tag != requireAspectName) {
                event.setFailed(true, "wrong aspect input type");
            } else if (aspectInputBus.amount < 40) {
                event.preventProgressing("not enough aspect input");
            } else {
                aspectInputBus.takeFromContainer(aspectInputBus.aspect, aspectInputBus.amount);
                world.setBlockState(<blockstate:extrautils2:redstonelantern>, pos.up(8));
            }
        }
    })
    .addFinishHandler(function(event as RecipeFinishEvent) {
        val controller = event.controller;
        val world = controller.world;
        val pos = controller.pos;
        val posA as IBlockPos = pos.offset(controller.rotateWithControllerFacing(IBlockPos.create(-5, 0, 0)));
        val posB as IBlockPos = pos.offset(controller.rotateWithControllerFacing(IBlockPos.create(5, 10, 10)));
        for entity in world.getEntitiesInArea(posA, posB) {
            if (entity.native instanceof EntityFluxRift) {
                world.performExplosion(null, entity.x, entity.y, entity.z, 1.5f, false, false);
                entity.setDead();
            }
        }
        world.setBlockState(<blockstate:extrautils2:redstonelantern>, controller.pos.up(8));
    })
    .build();
