#loader mixin

#mixin {targets: "dalapo.factech.tileentity.specialized.TileEntityFluidDrill"}
zenClass MixinTileEntityFluidDrill {
    #mixin Inject{method: "performAction", at: {value: "HEAD"}}
    function alwaysOutputSulphur(cir as mixin.CallbackInfoReturnable) as void {
        this0.drillSulphur = true;
    }
}
