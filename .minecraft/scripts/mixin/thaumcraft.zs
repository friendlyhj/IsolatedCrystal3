#loader mixin

import native.java.util.ArrayList;
import native.net.minecraft.item.ItemStack;
import native.thaumcraft.api.aspects.AspectList;

#mixin Mixin
#{targets: "thaumcraft.common.config.ConfigAspects"}
zenClass MixinConfigAspect {
    #mixin Static
    #mixin Overwrite
    function registerItemAspects() as void {
        // NO-OP
    }
}
