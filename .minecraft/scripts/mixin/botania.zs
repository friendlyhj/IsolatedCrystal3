#loader mixin

import native.net.minecraft.entity.Entity;
import native.net.minecraft.entity.player.EntityPlayer;
import native.net.minecraft.util.DamageSource;
import native.net.minecraft.entity.EntityLiving;
import native.vazkii.botania.common.entity.EntityManaBurst;
import mixin.CallbackInfo;
import mixin.CallbackInfoReturnable;

#mixin {targets: "vazkii.botania.common.entity.EntityDoppleganger"}
zenClass MixinEntityDoppleganger extends EntityLiving {
    var lootDropped as bool = false;

    #mixin Static
    #mixin Overwrite
    function isTruePlayer(entity as Entity) as bool {
        return entity instanceof EntityPlayer;
    }

    #mixin Inject{method: "func_184610_a", at = {value: "INVOKE", target: "vazkii/botania/common/entity/EntityDoppleganger.func_184201_a(Lnet/minecraft/inventory/EntityEquipmentSlot;Lnet/minecraft/item/ItemStack;)V"}}
    function recordLootDrop(wasRecentlyHit as bool, lootingModifier as int, source as DamageSource, ci as CallbackInfo) as void {
        lootDropped = true;
    }

    #mixin Inject{method: "func_184610_a", at = {value: "TAIL"}}
    function dropAtLeastOne(wasRecentlyHit as bool, lootingModifier as int, source as DamageSource, ci as CallbackInfo) as void {
        if (!lootDropped) {
            super.dropLoot(wasRecentlyHit, lootingModifier, source);
        }
    }
}

#mixin {targets: "vazkii.botania.common.entity.EntityManaStorm"}
zenClass MixinEntityManaStorm {
    #mixin Inject{method: "func_70071_h_", at = {value: "INVOKE", target: "net/minecraft/world/World.func_72885_a(Lnet/minecraft/entity/Entity;DDDFZZ)Lnet/minecraft/world/Explosion;"}, cancellable: true}
    function removeLastExplosion(ci as CallbackInfo) as void {
        ci.cancel();
    }

    #mixin ModifyVariable{method: "spawnBurst", at = {value: "RETURN"}}
    function tagBurst(burst as EntityManaBurst) as EntityManaBurst {
        burst.addTag("storm");
        return burst;
    }
}
