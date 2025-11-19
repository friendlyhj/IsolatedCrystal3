#loader mixin

// Changes the check range of the Metaspatial Accumulator to be 3x larger.

#mixin {targets: "thecodex6824.thaumicaugmentation.common.tile.TileRiftMoverInput"}
zenClass MixinTileRiftMoverInput {
    #mixin ModifyConstant {method: "findRift", constant: [{intValue: 1, ordinal: 1}, {intValue: 1, ordinal: 2}, {intValue: -1, ordinal: 0}, {intValue: -1, ordinal: 1}]}
    function increaseRange(value as int) as int {
        return value * 3;
    }
}
