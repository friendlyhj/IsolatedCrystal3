#loader mixin

// Makes Fluid Drill always output Sulphur, Propane is not we want.

#mixin {targets: "dalapo.factech.tileentity.specialized.TileEntityFluidDrill"}
zenClass MixinTileEntityFluidDrill {
    #mixin Inject{method: "performAction", at: {value: "HEAD"}}
    function alwaysOutputSulphur(cir as mixin.CallbackInfoReturnable) as void {
        this0.drillSulphur = true;
    }
}
