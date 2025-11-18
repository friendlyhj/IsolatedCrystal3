#loader mixin

import native.net.minecraft.util.ITickable;

#mixin {targets: "griglog.thaumtweaks.blocks.crafter.TileArcaneCrafter"}
zenClass MixinTileArcaneCrafter extends ITickable {
    #mixin Overwrite
    function onInventoryUpdate() as void {
        // NO-OP
    }

    // update
    function func_73660_a() as void {
        if (this0.world.totalWorldTime % 20 == 4) {
            this0.checkCrafting();
        }
    }
}
