#loader mixin

import native.java.util.ArrayList;
import native.java.lang.Math;
import native.java.util.Random;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.entity.player.EntityPlayerMP;
import native.thaumcraft.api.aspects.AspectList;
import native.thaumcraft.api.capabilities.IPlayerKnowledge.EnumResearchStatus;
import native.thaumcraft.common.world.aura.AuraHandler;
import native.net.minecraft.nbt.NBTTagCompound;
import native.net.minecraft.world.World;
import native.net.minecraft.util.math.BlockPos;
import mixin.CallbackInfo;
import mixin.CallbackInfoReturnable;

// Removing Thaumcraft's item aspect registration.

#mixin {targets: "thaumcraft.common.config.ConfigAspects"}
zenClass MixinConfigAspect {
    #mixin Static
    #mixin Overwrite
    function registerItemAspects() as void {
        // NO-OP
    }
}

// Removing Thaumcraft's player knowledge system, so that all research is considered known.

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

// Removing all Crucible smelting recipes, except vis crystal and essential phial

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

// Allows pedestals to accept multiple items, allows infusion recipe to output multiple items

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

// Speeds up 2.5x of tube transportation.

#mixin {targets: ["thaumcraft.common.tiles.essentia.TileTube", "thaumcraft.common.tiles.essentia.TileTubeBuffer", "thaumcraft.common.tiles.essentia.TileTubeValve"]}
zenClass MixinTubeSpeedup {
    #mixin ModifyConstant {method: "func_73660_a", constant: {intValue: 5}}
    function speedup(value as int) as int {
        return 2;
    }
}

// Make the centrifuge output strictly one-to-one, rather than randomly

#mixin {targets: "thaumcraft.common.tiles.essentia.TileCentrifuge"}
zenClass MixinTileCentrifuge {
    var outputSecond as bool = false;

    #mixin Inject{method: "readSyncNBT", at: {value: "RETURN"}}
    function readOutputSecond(nbt as NBTTagCompound, ci as CallbackInfo) as void {
        this.outputSecond = nbt.getBoolean("outputSecond");
    }

    #mixin Inject{method: "writeSyncNBT", at: {value: "RETURN"}}
    function writeOutputSecond(nbt as NBTTagCompound, ci as CallbackInfoReturnable) as void {
        nbt.setBoolean("outputSecond", this.outputSecond);
    }

    #mixin Redirect{method: "processEssentia", at: {value: "INVOKE", target: "Ljava/util/Random;nextInt(I)I"}}
    function processEssentiaRandom(random as Random, value as int) as int {
        val x = this.outputSecond ? 1 : 0;
        this.outputSecond = !this.outputSecond;
        return x;
    }
}

#mixin {targets: "thaumcraft.common.entities.EntityFluxRift"}
zenClass MixinEntityFluxRift {
    #mixin Static
    #mixin ModifyVariable {method: "createRift", at: {value: "LOAD", ordinal: 0}, name: "size"}
    function setRiftSizeMax100(origin as double, world as World, pos as BlockPos) as double {
        val flux = AuraHandler.getFlux(world, pos);
        if (origin < 90) {
            return origin;
        }
        val mu = Math.min(origin, 100.0);
        val sigma = 11.0 - Math.cbrt(Math.max(0.0, 0.0 + flux - 3000)) / 3;
        val gaussian = world.rand.nextGaussian();
        return Math.round(mu - sigma * Math.abs(gaussian)) as double;
    }
}
