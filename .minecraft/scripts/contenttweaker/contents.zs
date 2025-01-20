#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.MaterialBuilder;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;

val itemNames as string[] = [
    // basic rainbow materials
    "blood_clot",
    "blazing_spark",
    "sand_dust", 
    "jade_leaf",
    "afflatus_of_crafting",
    "completed_afflatus_of_crafting",
    "mana_essence",
    "crushed_crushed",

    // lv1 rainbow crystals
    "flesh_crystal",
    "heated_crystal",
    "earth_crystal",
    "vibrant_crystal",
    "crafting_crystal",
    "ocean_crystal",
    "destruction_crystal",

    // lv2 rainbow crystals
    "blood_crystal",
    "electric_crystal",
    "metal_crystal",
    "aura_crystal",
    "logic_crystal",
    "astral_crystal",
    "warp_crystal",

    // lv3 rainbow crystals
    "life_crystal",
    "energy_crystal",
    "mine_crystal",
    "nature_crystal",
    "calculation_crystal",
    "space_time_crystal",
    "perditio_crystal",

    "iris_crystal",

    "bearing",
    "brass_gear",
    "lactic_acid_mixture",
    "lactic_acid_bacteria",
    "crystal_alga",
    "space_grid",
    "space_matrix",

    // ae2 modules
    "item_module",
    "network_module",
    "advanced_network_module",
    "crafting_module",
    "write_module",
    "usb_module",
    "liquid_module",
    "world_module",
    "gas_module",
    "essentia_module"
];

for name in itemNames {
    VanillaFactory.createItem(name).register();
}

val log = VanillaFactory.createDirectionalBlock("crystal_log", <blockmaterial:wood>, "ALL");
log.blockResistance = 1800000.0f;
log.blockLayer = "TRANSLUCENT";
log.fullBlock = false;
log.translucent = true;
log.blockHardness = -1;
log.toolClass = "";
log.toolLevel = 0;
log.register();

val leaves = VanillaFactory.createBlock("crystal_leaves", <blockmaterial:plants>);
leaves.blockResistance = 1800000.0f;
leaves.blockLayer = "TRANSLUCENT";
leaves.translucent = true;
leaves.fullBlock = false;
leaves.blockHardness = -1;
leaves.toolClass = "";
leaves.toolLevel = 0;
leaves.register();

val crusher = VanillaFactory.createBlock("mana_crusher", <blockmaterial:rock>);
crusher.blockHardness = 3.0f;
crusher.register();

val destructionMatrix = VanillaFactory.createBlock("destruction_matrix", <blockmaterial:rock>);
destructionMatrix.register();

val colors as int[string] = {
    "red": 0xb92837,
    "orange": 0xf19149,
    "yellow": 0xfff45c,
    "green": 0x32b16c,
    "cyan": 0x13b5b1,
    "blue": 0x0068b7,
    "purple": 0x66188b
};

for name, color in colors {
    val block = VanillaFactory.createBlock(name ~ "_fruit_block", <blockmaterial:plants>);
    block.blockHardness = 1.0f;
    block.textureLocation = ResourceLocation.create("contenttweaker:blocks/crystal_fruit_block");
    block.blockLayer = "TRANSLUCENT";
    block.fullBlock = false;
    block.dropHandler = function(drops, world, pos, state, fortune) {
        drops.clear();
        drops.add(<item:contenttweaker:${name}_fruit>);
    };
    block.blockColorSupplier = function(state, world, pos, tintIndex) {
        return Color.fromInt(color);
    };
    block.itemColorSupplier = function(item, tintIndex) {
        return Color.fromInt(color);
    };
    block.register();

    val fruitItemName = name ~ "_fruit";
    var item as Item = null;
    if (name == "red") {
        val food = VanillaFactory.createItemFood(fruitItemName, 4);
        food.alwaysEdible = true;
        food.saturation = 0.5f;
        food.onItemFoodEaten = function(item, world, player) {
            if (!world.remote) {
                player.clearActivePotions();
                player.getAttribute("generic.maxHealth").removeModifier("299b5fd4-7f4f-456e-bbd6-a3db8da075e0");
                player.heal(18.0f);
            }
        };
        item = food;
    } else {
        item = VanillaFactory.createItem(fruitItemName);
    }
    item.itemColorSupplier = function(item, tintIndex) {
        return tintIndex == 0 ? Color.fromInt(color) : Color.fromInt(0xffffff);
    };
    item.textureLocation = ResourceLocation.create("contenttweaker:items/crystal_fruit");
    item.register();
}

val emberOre = VanillaFactory.createBlock("ember_ore", <blockmaterial:rock>);
emberOre.blockHardness = 2.0f;
emberOre.toolClass = "pickaxe";
emberOre.toolLevel = 2;
emberOre.dropHandler = function(drops, world, pos, state, fortune) {
    drops.clear();
    drops.add(<item:embers:crystal_ember> * 2);
    drops.add(<item:embers:crystal_ember> % 50);
    drops.add(<item:embers:crystal_ember> % 20);
    drops.add(<item:embers:shard_ember> % 10);
};
emberOre.register();

val superconductor = VanillaFactory.createBlock("superconductor", <blockmaterial:iron>);
superconductor.register();

val moltenFluids as int[string] = {
    "soldering": 0x246755,
    "compressed_iron": 0x34302d,
    "mithril": 0x8adaff,
    "temped_iron": 0xadc5c8,
    "metal_crystal_liquid": 0xefb207
};

val plainFluids as int[string] = {
    "undead_water": 0x550000,
    "vinyl_chloride": 0x46745d,
    "mercury": 0xdddddd,
    "lactic_acid": 0xeeeeb9,
    "poly_lactic_acid": 0xccccb9,
    "mine_medium": 0x9269ef,
};

for name, color in moltenFluids {
    val molten = VanillaFactory.createFluid(name, color);
    molten.material = <blockmaterial:lava>;
    molten.temperature = 500;
    molten.density = 3000;
    molten.luminosity = 10;
    molten.stillLocation = "base:fluids/molten";
    molten.flowingLocation = "base:fluids/molten_flowing";
    molten.register();
}

for name, color in plainFluids {
    val fluid = VanillaFactory.createFluid(name, color);
    fluid.register();
}

val materials as int[string] = {
    "iron" : 0xd8af93,
    "coal" : 0x0f0f0f,
    "copper" : 0xff4100,
    "lead" : 0x818ebe,
    "tin" : 0xdbdbdb,
    "nickel" : 0xd2d2ac,
    "silver" : 0xf7f7f7,
    "lapis" : 0x1010cb,
    "aluminum": 0xe8e8e8,
    "gold" : 0xffff00,
    "iridium" : 0xeaeaea,
    "osmium" : 0x1ea2f6,
    "redstone" : 0x720000,
    "certus": 0xa9cdd1,
    "diamond": 0x8cf4e2,
    "emerald": 0x41f384,
    "platinum": 0x67d5f7,
    "uranium": 0x4b694a
};

val sacrifice = MaterialSystem.getPartBuilder()
    .setName("ore_sacrifice")
    .setPartType(MaterialSystem.getPartType("item"))
    .build();

for name, color in materials {
    val material = MaterialSystem.getMaterialBuilder()
        .setName(name)
        .setColor(color)
        .build();
    material.registerPart(sacrifice);
}
