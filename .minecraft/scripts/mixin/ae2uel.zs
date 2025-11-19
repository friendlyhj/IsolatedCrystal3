#loader mixin

import mixin.CallbackInfoReturnable;
import native.appeng.api.AEApi;

// Fixes the bug that causes the Fluid P2P Tunnel can not be gained by clicking a P2P Tunnel using a fluid container.

#mixin {targets: "appeng.api.config.TunnelType"}
zenClass MixinTunnelType {
    #mixin Inject{method: "getPartItemStack", at: {value: "HEAD"}, cancellable: true}
    function fixFluidP2P(cir as CallbackInfoReturnable) {
        if (this0.name() == "FLUID") {
            cir.setReturnValue(AEApi.instance().definitions().parts().p2PTunnelFluids().maybeStack(1).get());
        }
    }
}