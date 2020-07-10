#loader contenttweaker
#priority 450
import crafttweaker.item.IItemStack;

static colliderRecipesOne as byte[][][IItemStack] = {
    // 0 means air, 1 means proton, 2 means neutron
    /*
        [_,blue,_],
        [orange,collider,green],
        [_,purple,_]
    */
    <item:minecraft:cobblestone> * 4 : [
        [0,1,0],
        [0,0,2],
        [0,0,0]
    ],
    <item:minecraft:dye:15> : [
        [0,0,0],
        [1,0,2],
        [0,0,0]
    ],
    <item:minecraft:gunpowder> : [
        [1,0,0],
        [0,0,0],
        [0,2,0]
    ],
    <item:minecraft:string> : [
        [0,1,0],
        [0,0,0],
        [0,2,0]
    ],
    <item:minecraft:sapling> : [
        [1,2,0],
        [0,0,0],
        [0,0,0]
    ],
    <item:minecraft:sapling:1> : [
        [1,0,2],
        [0,0,0],
        [0,0,0]
    ],
    <item:minecraft:sapling:2> : [
        [1,0,0],
        [0,0,2],
        [0,0,0]
    ],
    <item:minecraft:sapling:3> : [
        [1,0,0],
        [0,0,0],
        [0,0,2]
    ],
    <item:minecraft:sapling:4> : [
        [1,0,0],
        [2,0,0],
        [0,0,0]
    ],
    <item:minecraft:sapling:5> : [
        [1,0,0],
        [0,0,0],
        [0,2,0]
    ],
    <item:minecraft:sand> * 4 : [
        [0,0,0],
        [0,0,2],
        [0,0,1]
    ],
    <item:minecraft:gravel> * 4 : [
        [0,0,0],
        [0,0,1],
        [0,0,2]
    ],
    <item:minecraft:dirt> * 4 : [
        [0,1,0],
        [0,0,0],
        [2,0,0]
    ],
    <item:minecraft:coal> : [
        [2,0,1],
        [0,0,0],
        [0,0,0]
    ],
    <item:contenttweaker:water_drop> : [
        [0,0,0],
        [0,0,1],
        [0,2,0]
    ]
};

static colliderRecipesTwo as byte[][][IItemStack] = {
    <item:minecraft:netherrack> * 4 : [
        [1,0,2],
        [1,0,0],
        [2,0,0]
    ],
    <item:minecraft:soul_sand> * 4 : [
        [1,1,0],
        [0,0,0],
        [0,2,2]
    ],
    <item:contenttweaker:lava_drop> : [
        [0,1,0],
        [1,0,2],
        [0,2,0]
    ],
    <item:minecraft:grass> : [
        [2,0,1],
        [2,0,0],
        [1,0,0]
    ],
    <item:minecraft:wheat_seeds> : [
        [1,2,0],
        [1,0,2],
        [0,0,0]
    ],
    <item:minecraft:melon_seeds> : [
        [1,0,2],
        [1,0,2],
        [0,0,0]
    ],
    <item:minecraft:pumpkin_seeds> : [
        [1,0,0],
        [1,0,0],
        [2,0,2]
    ],
    <item:minecraft:carrot> : [
        [0,1,1],
        [0,0,0],
        [2,0,2]
    ],
    <item:minecraft:beetroot_seeds> : [
        [0,2,1],
        [0,0,0],
        [1,0,2]
    ],
    <item:minecraft:dye> : [
        [1,0,2],
        [0,0,0],
        [2,0,1]
    ],
    <item:minecraft:dye:3> : [
        [1,0,0],
        [2,0,2],
        [1,0,0]
    ],
    <item:contenttweaker:metal_chunk> : [
        [2,0,0],
        [1,0,1],
        [2,0,0]
    ]
};

static colliderRecipesThree as byte[][][IItemStack] = {
    <item:minecraft:blaze_rod> : [
        [0,1,0],
        [1,0,2],
        [0,2,0]
    ],
    <item:contenttweaker:wither_skull_piece> : [
        [2,0,0],
        [2,0,1],
        [0,0,1]
    ],
    <item:contenttweaker:little_ghast_drop> : [
        [2,2,0],
        [0,0,0],
        [0,1,1]
    ],
    <item:contenttweaker:mystical_gem> : [
        [0,1,2],
        [1,0,2],
        [0,0,0]
    ]
};

static colliderRecipesFour as byte[][][IItemStack] = {
    
};