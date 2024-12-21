#reloadable

import crafttweaker.world.IWorld;
import mods.contenttweaker.Item;
import mods.contenttweaker.ActionResult;

val redFruit as Item = <cotItem:red_fruit>;
val orangeFruit as Item = <cotItem:orange_fruit>;
val yellowFruit as Item = <cotItem:yellow_fruit>;
val greenFruit as Item = <cotItem:green_fruit>;
val cyanFruit as Item = <cotItem:cyan_fruit>;
val blueFruit as Item = <cotItem:blue_fruit>;
val purpleFruit as Item = <cotItem:purple_fruit>;

val affc as Item = <cotItem:completed_afflatus_of_crafting>;

val natureCrystal as Item = <cotItem:nature_crystal>;

orangeFruit.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (!world.remote) {
        player.simulateRightClickItem(<minecraft:lava_bucket>);
        player.getHeldItem(hand).shrink(1);
    }
    return ActionResult.success();
};

blueFruit.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (!world.remote) {
        player.simulateRightClickItem(<minecraft:water_bucket>);
        player.getHeldItem(hand).shrink(1);
    }
    return ActionResult.success();
};

greenFruit.itemRightClick = function(item, world, player, hand) {
    if (!world.remote) {
        player.give(<minecraft:sapling>);
        item.shrink(1);
    }
    return "SUCCESS";
};

yellowFruit.itemRightClick = function(item, world, player, hand) {
    if (!world.remote) {
        player.give(<minecraft:dirt> * 8);
        item.shrink(1);
    }
    return "SUCCESS";
};

natureCrystal.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    if (!world.remote) {
        val origin = world.getBlockState(pos);
        player.simulateRightClickBlock(<minecraft:dye:15>);
        val now = world.getBlockState(pos);
        if (origin != now && world.random.nextInt(20) == 0) {
            player.getHeldItem(hand).shrink(1);
        } 
    }
    return ActionResult.success();
};

affc.glowing = true;

<contenttweaker:nature_crystal>.definition.addDispenserBehavior(function(source, item) {
    val world = source.world;
    val player = world.fakePlayer;
    val pos = source.pos.getOffset(source.facing, 1);
    val origin = world.getBlockState(pos);
    player.simulateRightClickBlock(<minecraft:dye:15>, mainHand, pos, source.facing.opposite, 0.0f, 0.0f, 0.0f);
    val now = world.getBlockState(pos);
    if (origin != now && world.random.nextInt(20) == 0) {
        item.mutable().shrink(1);
    }
    return item;
});

<contenttweaker:cyan_fruit>.definition.addDispenserBehavior(function(source, item) {
    val world = source.world;
    val pos = source.pos.getOffset(source.facing, 1);
    val block = world.getBlockState(pos);
    val blockItem = block.block.getItem(world, pos, block);
    if (<ore:logWood>.matches(blockItem)) {
        world.setBlockState(<blockstate:minecraft:crafting_table>, pos);
    }
    return item;
});

<contenttweaker:space_grid>.maxStackSize = 1;
<contenttweaker:space_matrix>.maxStackSize = 1;
