// by: youyihj
#loader contenttweaker
#priority 230

import mods.contenttweaker.BlockState;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.ActionResult;

val debugger as Item = VanillaFactory.createItem("debugger");
debugger.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (!world.remote) {
        val state as BlockState = world.getBlockState(pos);
        player.sendMessage(state.block.definition.id);
        player.sendMessage(state.block.meta);
        if (!isNull(state.block.data)) {
            player.sendMessage(state.block.data.asString());
        }
    }
    return ActionResult.success();
};
debugger.register();