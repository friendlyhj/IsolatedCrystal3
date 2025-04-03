#loader mixin

import mixin.CallbackInfoReturnable;
import native.appeng.api.AEApi;

#mixin {targets: "appeng.api.config.TunnelType"}
zenClass MixinTunnelType {
    #mixin Inject{method: "getPartItemStack", at: {value: "HEAD"}, cancellable: true}
    function fixFluidP2P(cir as CallbackInfoReturnable) {
        if (this0.name() == "FLUID") {
            cir.setReturnValue(AEApi.instance().definitions().parts().p2PTunnelFluids().maybeStack(1).get());
        }
    }
}