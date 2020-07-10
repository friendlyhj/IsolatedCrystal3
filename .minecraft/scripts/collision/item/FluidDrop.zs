// by: youyihj
#loader contenttweaker
#priority 230

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.ActionResult;
import mods.ctutils.utils.Math;

val water as Item = VanillaFactory.createItem("water_drop");
water.maxStackSize = 1;
water.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (world.getBlockState(pos.getOffset(facing, 1)) == <block:minecraft:air>) {
        if (!world.remote) {
            world.setBlockState(<block:minecraft:water>, pos.getOffset(facing, 1));
            player.getHeldItem(hand).shrink(1);
        }
        return ActionResult.success();
    }
    return ActionResult.pass();
};
water.register();

val lava as Item = VanillaFactory.createItem("lava_drop");
lava.maxStackSize = 1;
lava.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (world.getBlockState(pos.getOffset(facing, 1)) == <block:minecraft:air>) {
        if (!world.remote) {
            world.setBlockState(<block:minecraft:lava>, pos.getOffset(facing, 1));
            player.getHeldItem(hand).shrink(1);
        }
        return ActionResult.success();
    }
    return ActionResult.pass();
};
lava.register();