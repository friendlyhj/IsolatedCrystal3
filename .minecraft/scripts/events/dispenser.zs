<bloodmagic:activation_crystal>.definition.addDispenserBehavior(function(source, item) {
    if (item.hasTag) {
        val binding = item.tag.binding.name.asString();
        val player = source.world.getPlayerByName(binding);
        if (!isNull(player)) {
            player.simulateRightClickBlock(item, mainHand, source.pos.getOffset(source.facing, 1), source.facing.opposite(), 0.5f, 0.5f, 0.5f);
        }
    }
    return item;
});

<minecraft:dye:15>.definition.addDispenserBehavior(function(source, item) {
    if (item.damage != 15) {
        return item;
    }
    val world = source.world;
    val player = world.fakePlayer;
    val pos = source.pos.getOffset(source.facing, 1);
    val origin = world.getBlockState(pos);
    player.simulateRightClickBlock(<minecraft:dye:15>, mainHand, pos, source.facing.opposite, 0.0f, 0.0f, 0.0f);
    item.mutable().shrink(1);
    return item;
});
