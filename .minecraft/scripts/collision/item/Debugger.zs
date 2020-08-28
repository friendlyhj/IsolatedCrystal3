// by: youyihj
#loader contenttweaker
#priority 230

import mods.contenttweaker.BlockState;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.ActionResult;
import crafttweaker.data.IData;

val debugger as Item = VanillaFactory.createItem("debugger");
debugger.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (!world.remote) {
        val state as BlockState = world.getBlockState(pos);
        player.sendMessage(state.block.definition.id);
        player.sendMessage(state.block.meta);
        val data as IData = world.getBlock(pos.x, pos.y, pos.z).data;
        if (!isNull(data)) {
            player.sendMessage(data.asString());
        }
    }
    return ActionResult.success();
};
debugger.register();