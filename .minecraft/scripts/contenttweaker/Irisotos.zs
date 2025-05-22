#reloadable
import crafttweaker.event.BlockNeighborNotifyEvent;
import mods.randomtweaker.botania.IBotaniaFXHelper;
import crafttweaker.command.ICommandManager;
import mods.zenutils.ICatenationBuilder;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import mods.zenutils.NetworkHandler;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.block.IBlock;
import crafttweaker.data.IData;
import crafttweaker.util.Math;
import crafttweaker.util.IRandom;
import crafttweaker.entity.IEntityItem;
import mods.zenutils.IByteBuf;
import scripts.libs.Vector3D;

static MANA_DRAIN as double=160;
static IRISOTOS_RADIUS as int=1;
static flowers as int[string] = {
    "hydroangeas":0,
    "endoflame":1,
    "thermalily":2,
    "arcanerose":3,
    "munchdew":4,
    "entropinnyum":5,
    "kekimurus":6,
    "gourmaryllis":7,
    "narslimmus":8,
    "spectrolus":9,
    "dandelifeon":10,
    "rafflowsia":11,
    "shulk_me_not":12
};
function getColor(name as string, random as IRandom)as int{
    if(name=="hydroangeas")return 0x8888FF;
    if(name=="endoflame")return 0xFF8800;
    if(name=="thermalily")return 0xFF2222;
    if(name=="arcanerose")return 0xCC7777;
    if(name=="munchdew")return 0x77FF77;
    if(name=="entropinnyum")return 0xAA0000;
    if(name=="kekimurus"){
        if(random.nextDouble()<0.7)return 0xFFFFFF;
        return 0xFF0000;
    }
    if(name=="gourmaryllis")return 0xFFFF00;
    if(name=="narslimmus")return 0x77CC77;
    if(name=="spectrolus"){
        var t=random.nextDouble() *3.1416*2;
        var r=(Math.sin(t)*127+128) as int;
        var g=(Math.sin(t+120)*127+128) as int;
        var b=(Math.sin(t+240)*127+128) as int;
        return b+256*(g+256*r);
    }
    if(name=="rafflowsia")return 0xFF44FF;
    if(name=="shulk_me_not")return 0xCC00CC;
    if(name=="dandelifeon"){
        if(random.nextDouble()<0.5)return 0xFF7777;
        return 0x55FF55;
    }
}
function getFlowerName(w as IWorld, p as IBlockPos)as string{
    var d as IData=w.getBlock(p).data;
    if(!isNull(d))return d.deepGetString("subTileName");
    return "";
}
function getFlowerMana(w as IWorld,p as IBlockPos)as int{
    var d as IData=w.getBlock(p).data;
    if(!isNull(d)) return d.deepGetInt("subTileCmp.mana");
    return 0;
}
function irisotosWork(world as IWorld, pos as IBlockPos) as void {
    for entity in world.getEntitiesInArea(pos.add(-1, -1, -1), pos.add(1, 1, 1)) {
        if (entity instanceof IEntityItem) {
            val entityItem as IEntityItem = entity;
            val item = entityItem.item;
            if (<botania:elfglass>.matches(entityItem.item)) {
                val time as int = entityItem.forgeData.deepGetInt("iris");
                entityItem.update({iris: time + 1});
                if (time >= 40) {
                    if (item.amount == 1) {
                        entityItem.setDead();
                    } else {
                        entityItem.setItem(<botania:elfglass> * (item.amount - 1));
                        entityItem.update({iris: 0});
                    }
                    world.spawnEntity(<botania:bifrostperm>.createEntityItem(world, entity.x as float, entity.y as float, entity.z as float));
                }
                NetworkHandler.sendToAllAround("IrisotosTransform", entity.x, entity.y, entity.z, 10, world.getDimension(), function(b) {
                    b.writeDouble(entity.x);
                    b.writeDouble(entity.y);
                    b.writeDouble(entity.z);
                });
                return;
            }
        }
    }
}
<cotSubTile:irisotos>.onUpdate = function(tile, world, pos) {
    var r as int=IRISOTOS_RADIUS;         //radius
    var d as int=r*2+1;     //diameter

    for i in 0 to d*2+1{
        for j in 0 to d*2+1{
            for k in 0 to d*2+1{
                var pos1 as IBlockPos=IBlockPos.create(pos.x+i-d,pos.y+j-d,pos.z+k-d);
                var name as string=getFlowerName(world,pos1);
                if(pos1.x!=pos.x||pos1.y!=pos.y||pos1.z!=pos.z)if(name=="irisotos"){
                    //world.setBlockState(<blockstate:minecraft:air>,pos1);
                    if(!world.remote)//world.spawnEntity(<botania:specialflower>.withTag({type: "irisotos"}).createEntityItem(world,pos1));
                        world.destroyBlock(pos1, true);
                    else{
                        for ii in 0 to 20{
                            var rat=0.1*ii;
                            var v=0.03;
                            IBotaniaFXHelper.wispFX(
                                0.5+pos1.x+(0.4-rat)*(i-d),0.5+pos1.y+(0.4-rat)*(j-d),0.5+pos1.z+(0.4-rat)*(k-d),
                                1,0,0,0.3,
                                v*(i-d)*(0.1+rat),v*(-0.1+j-d)*(0.1+rat),v*(k-d)*(0.1+rat),2
                            );
                            IBotaniaFXHelper.wispFX(
                                0.5+pos.x+(0.4-rat)*(d-i),0.5+pos.y+(0.4-rat)*(d-j),0.5+pos.z+(0.4-rat)*(d-k),
                                1,0,0,0.3,
                                v*(d-i)*(0.1+rat),v*(-0.1+d-j)*(0.1+rat),v*(d-k)*(0.1+rat),2
                            );
                        }
                    }
                }
            }
        }
    }
    if(world.remote)return;

    var flags as int=0;
    var flagsForClient as int=0;
    var t1 as IData=tile.getCustomData();
    var manas as IData=(!isNull(t1)&&t1 has "manas")?t1.manas:IData.createEmptyMutableDataMap();
    var timers as IData=(!isNull(t1)&&t1 has "timers")?t1.timers:IData.createEmptyMutableDataMap();
    for i in 0 to d{
        for j in 0 to d{
            for k in 0 to d{
                var pos1 as IBlockPos=IBlockPos.create(pos.x+i-r,pos.y+j-r,pos.z+k-r);
                var compressedIndex as int=(d*(d*i+j)+k);
                var ci as string=""~compressedIndex; //compressed index
                var dat as IData=world.getBlock(pos1).data;
                var name as string=getFlowerName(world,pos1);
                dat=(isNull(dat)||!(dat has"subTileCmp"))?IData.createEmptyMutableDataMap():dat.subTileCmp;
                //Run Timer & Update Mana
                var lastMana=((manas has ci)?manas.memberGet(ci).asInt():0)as double;
                var mana as int=getFlowerMana(world,pos1);
                var time as int=(timers has ci)?timers.memberGet(ci).asInt():0;
                var toUpdate=IData.createEmptyMutableDataMap();
                toUpdate.memberSet(ci,mana);
                manas=manas+toUpdate;
                //Check if flower is working
                if(flowers has name){
                    var id as int=flowers[name]as int;
                    var working=false;
                    if(id==0||id==2)working=(dat.burnTime.asInt()>0)||(dat.cooldown.asInt()>0);
                    else if(id==1)working=(dat.burnTime.asInt()>0);
                    else if(id==7)working=(dat.cooldown>0);
                    else if(id==4)working=dat.ateOnce.asBool();
                    else{
                        var ratio as double=1.0;
                        if(id==6)ratio=40.0;
                        if(id==11)ratio=90.0;
                        if(id==10)ratio=2.0;
                        if(id==5)ratio=10.0;
                        if(lastMana<mana)time=((ratio*mana-lastMana)/MANA_DRAIN+time)as int;
                        if(id==3){
                            if(dat.collectorY>=0){
                                var pos2 as IBlockPos=IBlockPos.create(
                                    dat.collectorX.asInt(),dat.collectorY.asInt(),dat.collectorZ.asInt()
                                );
                                var spreader as IBlock=world.getBlock(pos2);
                                var spreaderDat as IData=spreader.data;
                                if(!isNull(spreaderDat)&&spreaderDat has"mana"){
                                    var mana1=spreaderDat.mana;
                                    var manaCap=(spreader.meta>2)?6400:1000;
                                    time=time+1;
                                }
                            }
                            working=working||(time>0);
                        }else working=(time>0);
                    }
                    if(working){
                        flags=flags|Vector3D.pow2(id);
                        flagsForClient=flagsForClient|Vector3D.pow2(compressedIndex);
                    }
                    if(id!=10&&id!=12){
                        if(time>200)time=200;
                    }else if(time>5000)time=5000;
                }
                else time=0;
                toUpdate.memberSet(ci,(time<1)?0:time- 1);
                timers=timers+toUpdate;
            }
        }
    }
    if(!world.remote){
        if(!isNull(world.getBlock(pos).data)&&world.getBlock(pos).data.subTileCmp.ticksExisted>1){
            tile.updateCustomData({"timers":timers,"manas":manas});
            if(flags==Vector3D.pow2(flowers.keys.length)- 1){
                irisotosWork(world,pos);
                tile.addMana(50000);
            }
        }
        else{
            tile.updateCustomData({"manas":manas});
        }
        NetworkHandler.sendToAllAround("IrisotosBotFXDat",
            pos.x,pos.y,pos.z,10,world.getDimension(),function(b){
                b.writeBlockPos(pos);
                b.writeInt(flagsForClient);
            });
    }
};
NetworkHandler.registerServer2ClientMessage("IrisotosBotFXDat",function(p,b){
    var world as IWorld=p.world;
    var random = world.random;
    var pos as IBlockPos=b.readBlockPos();
    var flags as int=b.readInt();
    var r as int=IRISOTOS_RADIUS;   //radius
    var d as int=r*2+1;             //diameter
    for i in 0 to d{
        for j in 0 to d{
            for k in 0 to d{
                var ci as int=k+d*(j+i*d);
                var pos1 as IBlockPos=IBlockPos.create(pos.x+i-r,pos.y+j-r,pos.z+k-r);
                var name as string=getFlowerName(world,pos1);
                if((flags/Vector3D.pow2(ci))%2==1){
                    var v=0.03;
                    var rgbr=1.0/255;
                    IBotaniaFXHelper.wispFX(
                        0.5+pos1.x,0.5+pos1.y,0.5+pos1.z,
                        rgbr*(getColor(name, random)/256/256),rgbr*(getColor(name, random)/256%256),rgbr*(getColor(name, random)%256),0.2,
                        v*(r-i),v*(-0.3+r-j),v*(r-k),1
                    );
                }
            }
        }
    }
});

static colors as int[] = [
    0xb92837,
    0xf19149,
    0xfff45c,
    0x32b16c,
    0x13b5b1,
    0x0068b7,
    0x66188b
];

NetworkHandler.registerServer2ClientMessage("IrisotosTransform", function(player, buf){
    val x = buf.readDouble();
    val y = buf.readDouble();
    val z = buf.readDouble();
    val random = player.world.random;
    val d = random.nextInt(360);
    val motionX = Vector3D.sin(d) * 0.05;
    val motionY = 0.1;
    val motionZ = Vector3D.cos(d) * 0.05;
    val color = colors[random.nextInt(7)];
    val r = 1.0f * (color / 0x10000) / 255.0f;
    val g = 1.0f * ((color / 0x100) & 0xff) / 255.0f;
    val b = 1.0f * (color & 0xff) / 255.0f;
    IBotaniaFXHelper.wispFX(x, y, z, r, g, b, 0.3f, motionX, motionY, motionZ);
});

<botania:specialflower>.withTag({type: "irisotos"}).addTooltip(game.localize("modpack.tooltip.irisotos"));