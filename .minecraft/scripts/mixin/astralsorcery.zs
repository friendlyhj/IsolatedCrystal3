#loader mixin

import native.net.minecraft.entity.player.EntityPlayer;
import native.hellfirepvp.astralsorcery.common.crafting.IGatedRecipe;
import native.net.minecraft.util.math.BlockPos;
import native.net.minecraft.block.Block;
import native.net.minecraft.block.state.IBlockState;
import native.net.minecraft.world.World;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraftforge.fml.common.registry.ForgeRegistries;

#mixin {targets: "hellfirepvp.astralsorcery.common.tile.TileAltar"}
zenClass MixinTileAltar {
    #mixin Redirect {method: "findRecipe", at: {value: "INVOKE", target: "hellfirepvp/astralsorcery/common/crafting/IGatedRecipe.hasProgressionServer(Lnet/minecraft/entity/player/EntityPlayer;)Z"}}
    function removeResearchCheck(recipe as IGatedRecipe, player as EntityPlayer) as bool {
        return true;
    }
}

#mixin {targets: "hellfirepvp.astralsorcery.common.block.BlockCelestialCrystals"}
zenClass MixinBlockCelestialCrystals {
    #mixin Overwrite
    function checkSafety(world as World, pos as BlockPos) as bool {
        return true;
    }
}

#mixin {targets: "hellfirepvp.astralsorcery.common.tile.TileCelestialCrystals"}
zenClass MixinTileCelestialCrystals {
    #mixin ModifyArg {method: "func_73660_a", at: {value: "INVOKE", target: "net/minecraft/world/World.func_175656_a(Lnet/minecraft/util/math/BlockPos;Lnet/minecraft/block/state/IBlockState;)Z"}, index: 1}
    function setTranformationState(state as IBlockState) as IBlockState {
        val block = ForgeRegistries.BLOCKS.getValue(ResourceLocation("thermalfoundation", "ore")) as Block;
        return block.getStateFromMeta(1);
    }
}   

