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
