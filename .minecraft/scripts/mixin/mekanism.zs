#loader mixin

import native.net.minecraft.world.World;

// Makes Solar Neutron Activator always work, because we are in eternal night mode

#mixin {targets: "mekanism.common.tile.machine.TileEntitySolarNeutronActivator"}
zenClass MixinTileEntitySolarNeutronActivator {
    #mixin Redirect {method: "onUpdate", at: {value: "INVOKE", target: "net/minecraft/world/World.func_72935_r()Z"}}
    function alwaysWorks(world as World) as bool {
        return true;
    }
}
