#loader mixin

import native.net.minecraft.util.EnumFacing;

// Fixes Modular Machinery Aspect Provider suction amounts to fix issues with aspect transfer system.

#mixin {targets: "kport.modularmagic.common.tile.TileAspectProvider$Input"}
zenClass MixinTileAspectProviderInput {
    function getSuctionAmount(facing as EnumFacing) as int {
        return this0.amount < 250 ? 128 : 0;
    }
}

#mixin {targets: "kport.modularmagic.common.tile.TileAspectProvider$Output"}
zenClass MixinTileAspectProviderOutput {
    function getSuctionAmount(facing as EnumFacing) as int {
        return 4;
    }
}
