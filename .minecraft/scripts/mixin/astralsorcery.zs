#loader mixin

import native.net.minecraft.entity.player.EntityPlayer;
import native.hellfirepvp.astralsorcery.common.crafting.IGatedRecipe;

#mixin {targets: "hellfirepvp.astralsorcery.common.tile.TileAltar"}
zenClass MixinTileAltar {
    #mixin Redirect {method: "findRecipe", at: {value: "INVOKE", target: "hellfirepvp/astralsorcery/common/crafting/IGatedRecipe.hasProgressionServer(Lnet/minecraft/entity/player/EntityPlayer;)Z"}}
    function removeResearchCheck(recipe as IGatedRecipe, player as EntityPlayer) as bool {
        return true;
    }
}
