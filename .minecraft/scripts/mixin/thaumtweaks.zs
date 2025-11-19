#loader mixin

import native.net.minecraft.util.ITickable;

// Fixes the Arcane Crafter do not update crafting progress when the vis is enough.
// Because it checks recipe only when its inventory is updated, which is not triggered by the vis update.
// This makes the Arcane Crafter update its crafting progress every 20 ticks

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
