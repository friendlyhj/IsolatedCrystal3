#loader mixin

#mixin {targets: "nc.integration.tconstruct.TConstructExtras"}
zenClass MixinTCExtras {
    // I wonder why MoT doesn't work

    #mixin Static
    #mixin Redirect {method: "init", at: {"value": "INVOKE", target: "nc/integration/tconstruct/TConstructExtras.registerAlloyRecipe([Ljava/lang/Object;)V", ordinal: 2}}
    function removeToughAlloy(objects as native.java.lang.Object[]) as void {
        // NO-OP
    }
}
