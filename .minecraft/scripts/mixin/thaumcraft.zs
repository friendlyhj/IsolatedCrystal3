#loader mixin

import native.java.util.ArrayList;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.entity.player.EntityPlayerMP;
import native.thaumcraft.api.aspects.AspectList;
import native.thaumcraft.api.capabilities.IPlayerKnowledge.EnumResearchStatus;
import mixin.CallbackInfoReturnable;

#mixin {targets: "thaumcraft.common.config.ConfigAspects"}
zenClass MixinConfigAspect {
    #mixin Static
    #mixin Overwrite
    function registerItemAspects() as void {
        // NO-OP
    }
}

#mixin {targets: "thaumcraft.common.lib.capabilities.PlayerKnowledge$DefaultImpl"}
zenClass MixinPlayerKnowledge {
    #mixin Overwrite
    function isResearchKnown(res as string) as bool {
        return true;
    }

    #mixin Overwrite
    function getResearchStatus(res as string) as EnumResearchStatus {
        return EnumResearchStatus.COMPLETE;
    }
}

#mixin {targets: "thaumcraft.common.tiles.crafting.TileCrucible"}
zenClass MixinTileCrucible {
    #mixin Inject{method: "attemptSmelt", at: {value: "HEAD"}, cancellable: true}
    function removeItemSmelt(item as ItemStack, userName as string, cir as CallbackInfoReturnable) as ItemStack {
        val name = item.item.registryName.toString();
        if (name != "thaumcraft:crystal_essence" && name != "thaumcraft:phial" && name != "thaumcraft:nugget") {
            cir.setReturnValue(item);
        }
    }
}

#mixin {targets: "thaumcraft.common.tiles.crafting.TilePedestal"}
zenClass MixinTilePedestal {
    #mixin Overwrite
    function setInventorySlotContentsFromInfusion(slot as int, item as ItemStack) as void {
        this0.getItems()[slot] = item;
        this0.markDirty();
        if (slot == 0) {
            this0.syncSlots(null);
        }
        if (!this0.world.isRemote) {
            this0.syncTile(false);
        }
    }
}
