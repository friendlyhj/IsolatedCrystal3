#reloadable
import scripts.libs.Vector3D;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import native.net.minecraft.util.EnumFacing;
import native.net.minecraft.world.World;
import native.net.minecraft.util.math.BlockPos;
import mods.zenutils.NetworkHandler;
import mods.contenttweaker.VanillaFactory;
import mods.randomtweaker.botania.IBotaniaFXHelper;


// author: Jey_yz
function maximium(ints as int[])as int{
    var max = 0;
    for i in ints{
        if(max<i)max = i;
    }
    return max;
}

static effectRadius as int = 10;
static fuels as int[IItemStack] = {
    <contenttweaker:nature_crystal>: 300 * 20,
    <contenttweaker:iris_crystal>: 1500 * 20
};

VanillaFactory.putTileEntityTickFunction(114, function(te, w, p){
    if(w.remote)return;
    val data as IData = te.data;
    if (!isNull(data) && data has "time") {
        te.updateCustomData({time: data.time.asInt() + 1});
    } else {
        te.updateCustomData({time: 1});
    }
    if (isNull(data) || !(data has "fuel")) {
        te.updateCustomData({fuel: 0});
    }
    val world as IWorld = IWorld.getFromID(w.dimension);
    val pos as IBlockPos = IBlockPos.create(p.x,p.y,p.z);
    if(isNull(te.data.fuel))return;
    var restfuel = te.data.fuel.asInt();
    val handler = world.getItemHandler(pos.getOffset(up, 1),down);
    if(isNull(handler))return;
    if(restfuel < 1){
        for i,item in handler{
            for fuel,time in fuels{
                if(isNull(item))continue;
                if(fuel.matches(item)){
                    handler.extractItem(i,1,false);
                    restfuel = time;
                    break;
                }
            }
            if(restfuel>0)break;
        }
    }else{
        restfuel -= 1;
        val redstone = world.native.getRedstonePowerFromNeighbors(pos.native);
        val aura = world.getAuraInArea(pos, effectRadius);
        val changedAura = -500000 + redstone * 3000000 / 15 - aura;
        if(changedAura<0){
            world.getAuraChunk(pos).drainAura(pos, -1*changedAura, true, false);
        }else{
            world.getAuraChunk(pos).storeAura(pos, changedAura, true, false);
        }
        NetworkHandler.sendToAllAround("AuraConfigurator",
            pos.x,pos.y,pos.z,effectRadius,world.getDimension(),function(b){
                b.writeBlockPos(pos);
                b.writeInt(restfuel);
                b.writeInt(redstone);
        });
    }
    te.updateCustomData({fuel: restfuel});
});

NetworkHandler.registerServer2ClientMessage("AuraConfigurator",function(p,b){
    val pos = b.readBlockPos();
    val fuel = b.readInt();
    val redstone = b.readInt();
    var angle as double = 0.0;
    val radius = 4.0;
    for i in 0 to redstone+1{
        angle += 360.0/(redstone+1);
        IBotaniaFXHelper.wispFX(
            0.5+pos.x+radius*Vector3D.sinf(angle+fuel/2%360),0.5+pos.y+0.4*Vector3D.sinf(angle+fuel%360),0.5+pos.z+radius*Vector3D.cosf(angle+fuel/2%360),
            0,200,0,0.8*((fuel as double/maximium(fuels.values)<0.2)?0.2:(fuel as double/maximium(fuels.values))),
            0,0,0,1
        );
    }
});
