#loader contenttweaker
import mods.contenttweaker.VanillaFactory;

val itemNames as string[] = [
    // basic crystal fruits
    "red_fruit",
    "orange_fruit",
    "yellow_fruit",
    "green_fruit",
    "cyan_fruit",
    "blue_fruit",
    "purple_fruit",

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
    "taint_crystal",

    // lv3 rainbow crystals
    "life_crystal",
    "energy_crystal",
    "mine_crystal",
    "nature_crystal",
    "calculation_crystal",
    "space_time_crystal",
    "perditio_crystal",

    "iris_crystal",

    "bearing"
];

val fruit_blocks as string[] = [
    "red_fruit_block",
    "orange_fruit_block",
    "yellow_fruit_block",
    "green_fruit_block",
    "cyan_fruit_block",
    "blue_fruit_block",
    "purple_fruit_block"
];

for name in itemNames {
    VanillaFactory.createItem(name).register();
}

val log = VanillaFactory.createBlock("crystal_log", <blockmaterial:wood>);
log.blockResistance = 1800000.0f;
log.blockHardness = -1;
log.register();

val leaves = VanillaFactory.createBlock("crystal_leaves", <blockmaterial:leaves>);
leaves.blockResistance = 1800000.0f;
leaves.blockLayer = "CUTOUT";
leaves.blockHardness = -1;
leaves.register();

val crusher = VanillaFactory.createBlock("mana_crusher", <blockmaterial:rock>);
crusher.blockHardness = 3.0f;
crusher.register();

val destructionMatrix = VanillaFactory.createBlock("destruction_matrix", <blockmaterial:rock>);
destructionMatrix.register();

for name in fruit_blocks {
    val block = VanillaFactory.createBlock(name, <blockmaterial:plants>);
    block.blockHardness = 1.0f;
    block.setDropHandler(function(drops, world, pos, state, fortune) {
        drops.clear();
        drops.add(<item:contenttweaker:${name.substring(0, name.length - 6)}>);
    });
    block.register();
}

val moltenFluids as int[string] = {
    "soldering": 0x246755,
    "compressed_iron": 0x34302d
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


