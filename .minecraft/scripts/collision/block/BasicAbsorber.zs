// by: youyihj
#priority 245
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val proton as Block = VanillaFactory.createBlock("proton_empty", <blockmaterial:rock>);
proton.blockHardness = 1.0f;
proton.setBlockSoundType(<soundtype:stone>);
proton.setToolClass("pickaxe");
proton.setToolLevel(0);
proton.onRandomTick = function(world, blockPos, blockState){
    if (!world.remote && world.canSeeSky(blockPos.getOffset("up", 1)) && world.dayTime && world.getRandom().nextBoolean()) {
        world.setBlockState(<block:contenttweaker:proton>, blockPos);
    }
};
proton.register();

val neutron as Block = VanillaFactory.createBlock("neutron_empty", <blockmaterial:rock>);
neutron.blockHardness = 1.0f;
neutron.setBlockSoundType(<soundtype:stone>);
neutron.setToolClass("pickaxe");
neutron.setToolLevel(0);
neutron.onRandomTick = function(world, blockPos, blockState){
    if (!world.remote && world.canSeeSky(blockPos.getOffset("up", 1)) && world.dayTime && world.getRandom().nextBoolean()) {
        world.setBlockState(<block:contenttweaker:neutron>, blockPos);
    }
};
neutron.register();