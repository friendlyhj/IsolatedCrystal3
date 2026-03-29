#loader mixin
#sideonly client

#mixin {targets: "com.rwtema.extrautils2.particles.PacketParticleSplineCurve$1"}
zenClass MixinPacketParticleSplineCurve1 {
    #mixin Inject {method: "run", at: {value: "HEAD"}, cancellable: true}
    function avoidNPE(ci as mixin.CallbackInfo) as void {
        if (isNull(native.net.minecraft.client.Minecraft.getMinecraft().world)) {
            ci.cancel();
        }
    }
}
