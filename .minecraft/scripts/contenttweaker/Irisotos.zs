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
import crafttweaker.block.IBlockStateMatcher;
import crafttweaker.data.IData;
import crafttweaker.util.Math;
import crafttweaker.util.IRandom;
import crafttweaker.entity.IEntityItem;
import mods.zenutils.IByteBuf;
import scripts.libs.Vector3D;
import native.vazkii.botania.api.subtile.SubTileGenerating;

static IRISOTOS_RADIUS as int=1;

static HYDRONAMEAS as string = "hydroangeas";
static ENDOFLAME as string = "endoflame";
static THERMALILY as string = "thermalily";
static ARCANEROSE as string = "arcanerose";
static MUNCHDEW as string = "munchdew";
static ENTROPINNYUM as string = "entropinnyum";
static KEKIMURUS as string = "kekimurus";
static GOURMARYLLIS as string = "gourmaryllis";
static NARSLIMMUS as string = "narslimmus";
static SPECTROLUS as string = "spectrolus";
static DANDELIFEON as string = "dandelifeon";
static RAFFLOWSIA as string = "rafflowsia";
static SHULK_ME_NOT as string = "shulk_me_not";

static HYDRONAMEAS_ID as int = 0;
static ENDOFLAME_ID as int = 1;
static THERMALILY_ID as int = 2;
static ARCANEROSE_ID as int = 3;
static MUNCHDEW_ID as int = 4;
static ENTROPINNYUM_ID as int = 5;
static KEKIMURUS_ID as int = 6;
static GOURMARYLLIS_ID as int = 7;
static NARSLIMMUS_ID as int = 8;
static SPECTROLUS_ID as int = 9;
static DANDELIFEON_ID as int = 10;
static RAFFLOWSIA_ID as int = 11;
static SHULK_ME_NOT_ID as int = 12;

static FLOWER_ID_MAPPING as int[string] = {
    "hydroangeas": HYDRONAMEAS_ID, 
    "endoflame": ENDOFLAME_ID,
    "thermalily": THERMALILY_ID,
    "arcanerose": ARCANEROSE_ID,
    "munchdew": MUNCHDEW_ID,
    "entropinnyum": ENTROPINNYUM_ID,
    "kekimurus": KEKIMURUS_ID,
    "gourmaryllis": GOURMARYLLIS_ID,
    "narslimmus": NARSLIMMUS_ID,
    "spectrolus": SPECTROLUS_ID,
    "dandelifeon": DANDELIFEON_ID,
    "rafflowsia": RAFFLOWSIA_ID,
    "shulk_me_not": SHULK_ME_NOT_ID
};

static INSTANT_FLOWER_IDS as int[] = [
    ARCANEROSE_ID,
    ENTROPINNYUM_ID,
    KEKIMURUS_ID,
    NARSLIMMUS_ID,
    SPECTROLUS_ID,
    DANDELIFEON_ID,
    RAFFLOWSIA_ID,
    SHULK_ME_NOT_ID
];

static INSTANT_FLOWER_CACHE as int[] = [
    6000,
    6500,
    9001,
    12000,
    16000,
    50000,
    9000,
    75000
];

scripts.mixin.shared.Op.trackMana = function(flowerName as string, manaDifference as int, flower as SubTileGenerating) as void {
    // logger.logWarning(`${flowerName} generates ${manaDifference} mana`);
    if (FLOWER_ID_MAPPING has flowerName) {
        val flowerId = FLOWER_ID_MAPPING[flowerName] as int;
        if (INSTANT_FLOWER_IDS has flowerId) {
            val world as IWorld = flower.world.wrapper;
            val pos as IBlockPos = flower.pos.wrapper;
            var iristosPos as IBlockPos = null;

            for p in IBlockPos.getAllInBox(pos.add(-1, -1, -1), pos.add(1, 1, 1)) {
                if (getFlowerName(world, p) == 'irisotos') {
                    iristosPos = p;
                    break;
                }
            }

            if (isNull(iristosPos)) {
                return;
            }

            val iristosFlower = world.getSubTileEntityInGame(iristosPos);
            val currentMana = iristosFlower.data.deepGetInt(flowerName + "_mana");
            val newMana = min(INSTANT_FLOWER_CACHE[INSTANT_FLOWER_IDS.indexOf(flowerId)], currentMana + manaDifference);

            iristosFlower.updateCustomData({(flowerName + "_mana"): newMana});
        }
    }
};

static deniedBlocks as IBlockStateMatcher =
    <blockstate:botania:redstringrelay>.matchBlock();

function getColor(name as string, random as IRandom)as int{
    if(name==HYDRONAMEAS)return 0x8888FF;
    if(name==ENDOFLAME)return 0xFF8800;
    if(name==THERMALILY)return 0xFF2222;
    if(name==ARCANEROSE)return 0xCC7777;
    if(name==MUNCHDEW)return 0x77FF77;
    if(name==ENTROPINNYUM)return 0xAA0000;
    if(name==KEKIMURUS){
        if(random.nextDouble()<0.7)return 0xFFFFFF;
        return 0xFF0000;
    }
    if(name==GOURMARYLLIS)return 0xFFFF00;
    if(name==NARSLIMMUS)return 0x77CC77;
    if(name==SPECTROLUS){
        var t=random.nextDouble() *3.1416*2;
        var r=(Math.sin(t)*127+128) as int;
        var g=(Math.sin(t+120)*127+128) as int;
        var b=(Math.sin(t+240)*127+128) as int;
        return b+256*(g+256*r);
    }
    if(name==RAFFLOWSIA)return 0xFF44FF;
    if(name==SHULK_ME_NOT)return 0xCC00CC;
    if(name==DANDELIFEON){
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
    for entity in world.getEntitiesInArea(pos.add(-2, -2, -2), pos.add(2, 2, 2)) {
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

    for p in IBlockPos.getAllInBox(pos.add(-d, -d, -d), pos.add(d, d, d)) {
        var dx = p.x - pos.x;
        var dy = p.y - pos.y;
        var dz = p.z - pos.z;
        var denied as bool = deniedBlocks.matches(world.getBlockState(p));
        var name as string=getFlowerName(world, p);
        if(p.x!=pos.x||p.y!=pos.y||p.z!=pos.z)if(name=="irisotos" || denied){
            //world.setBlockState(<blockstate:minecraft:air>,pos1);
            if(!world.remote)//world.spawnEntity(<botania:specialflower>.withTag({type: "irisotos"}).createEntityItem(world,pos1));
                world.destroyBlock(p, true);
            else{
                for ii in 0 to 20{
                    var rat=0.1*ii;
                    var v=0.03;
                    IBotaniaFXHelper.wispFX(
                        0.5+p.x+(0.4-rat)*dx,0.5+p.y+(0.4-rat)*dy,0.5+p.z+(0.4-rat)*dz,
                        1,0,0,0.3,
                        v*dx*(0.1+rat),v*(-0.1+dy)*(0.1+rat),v*dz*(0.1+rat),2
                    );
                    IBotaniaFXHelper.wispFX(
                        0.5+p.x+(0.4-rat)*dx,0.5+p.y+(0.4-rat)*dy,0.5+p.z+(0.4-rat)*dz,
                        1,0,0,0.3,
                        v*dx*(0.1+rat),v*(-0.1+dy)*(0.1+rat),v*dz*(0.1+rat),2
                    );
                }
            }
        }
    }

    if(world.remote)return;

    var flags as int=0;
    var flagsForClient as int=0;
    var t1 as IData=tile.getCustomData();
    for p in IBlockPos.getAllInBox(pos.add(-r, -r, -r), pos.add(r, r, r)) {
        var dx = p.x - pos.x;
        var dy = p.y - pos.y;
        var dz = p.z - pos.z;
        var compressedIndex as int=(d*(d*(dx+r)+dy+r)+dz+r);
        var dat as IData=world.getBlock(p).data;
        var name as string=getFlowerName(world, p);
        dat = (isNull(dat)||!(dat has"subTileCmp"))?IData.createEmptyMutableDataMap():dat.subTileCmp;
        //Check if flower is working
        if(FLOWER_ID_MAPPING has name){
            var id as int = FLOWER_ID_MAPPING[name] as int;
            var working = false;

            if (id == HYDRONAMEAS_ID || id == THERMALILY_ID) {
                working = dat.burnTime.asInt() > 0 || dat.cooldown.asInt() > 0;
            } else if (id == ENDOFLAME_ID) {
                working = dat.burnTime.asInt() > 0;
            } else if (id == MUNCHDEW_ID) {
                working = dat.ateOnce.asBool();
            } else if (id == GOURMARYLLIS_ID) {
                working = dat.cooldown.asInt() > 0;
            } else if (INSTANT_FLOWER_IDS has id) {
                var partMana = t1.deepGetInt(name + "_mana");
                if (partMana > 0) {
                    working = true;
                }
                var consume = 40;
                if (id == DANDELIFEON_ID) {
                    consume = 12;
                } else if (id == KEKIMURUS_ID) {
                    consume = 22;
                } else if (id == ARCANEROSE_ID) {
                    consume = 35;
                }
                partMana = max(0, partMana - consume);
                tile.updateCustomData({(name + "_mana"): partMana});
            }
            if (working) {
                flags=flags|Vector3D.pow2(id);
                flagsForClient=flagsForClient|Vector3D.pow2(compressedIndex);
            }
        }
    }
    if(!isNull(world.getBlock(pos).data) && world.getBlock(pos).data.subTileCmp.ticksExisted > 1){
        if(flags == Vector3D.pow2(FLOWER_ID_MAPPING.length) - 1){
            irisotosWork(world,pos);
            tile.addMana(50000);
        }
    }
    NetworkHandler.sendToAllAround("IrisotosBotFXDat",
        pos.x,pos.y,pos.z,10,world.getDimension(),function(b){
            b.writeBlockPos(pos);
            b.writeInt(flagsForClient);
        });
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
