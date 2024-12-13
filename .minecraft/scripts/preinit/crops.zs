#loader preinit
#debug

import native.net.minecraft.init.Blocks;
import native.net.minecraft.block.Block;
import native.net.minecraft.block.BlockCrops;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraft.world.World;
import native.net.minecraft.item.Item;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.block.state.IBlockState;
import native.net.minecraft.item.ItemSeeds;
import native.java.util.Random;
import native.net.minecraftforge.event.RegistryEvent;

zenClass CrystalAlga extends BlockCrops {
    zenConstructor() {
        super();
    }

    // canUseBonemeal
    function func_180670_a(world as World, rand as Random, pos as BlockPos, state as IBlockState) as bool {
        return false;
    }

    // getSeed
    function func_149866_i() as Item {
        return itemUtils.getItem("contenttweaker:crystal_alga_seeds").definition.native;
    }

    // getCrop
    function func_149865_P() as Item {
        return itemUtils.getItem("contenttweaker:crystal_alga").definition.native;
    }
}

static crops as Block = CrystalAlga().setRegistryName("contenttweaker", "crystal_alga_crops");
static seeds as Item = ItemSeeds(crops, Blocks.FARMLAND).setTranslationKey("contenttweaker.crystal_alga_seeds").setRegistryName("contenttweaker", "crystal_alga_seeds");

events.register(function(event as RegistryEvent.Register) {
    val registryName = event.name.toString();
    if (registryName == "minecraft:blocks") {
        event.registry.register(crops);
    } else if (registryName == "minecraft:items") {
        event.registry.register(seeds);
    }
});
