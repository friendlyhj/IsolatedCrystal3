#loader preinit
#priority -1
#sideonly client

import native.net.minecraft.client.renderer.block.model.ModelResourceLocation;
import native.net.minecraftforge.client.model.ModelLoader;
import native.net.minecraftforge.client.event.ModelRegistryEvent;
import scripts.preinit.crops.seeds;

events.register(function(event as ModelRegistryEvent) {
    ModelLoader.setCustomModelResourceLocation(seeds, 0, ModelResourceLocation(seeds.registryName, "inventory"));
});
