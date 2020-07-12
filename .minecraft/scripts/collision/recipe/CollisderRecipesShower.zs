#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.IRecipeFunction;

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
    /* <item:minecraft:soul_sand> * 4 : [
        [1,1,0],
        [0,0,0],
        [0,2,2]
    ], */
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
    /* <item:contenttweaker:wither_skull_piece> : [
        [2,0,0],
        [2,0,1],
        [0,0,1]
    ], */
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

function getModule(code as byte, isRefined as bool) as IItemStack {
    if (code == 1) {
        return isRefined ? <item:contenttweaker:proton_refined> : <item:contenttweaker:proton>;
    }
    if (code == 2) {
        return isRefined ? <item:contenttweaker:neutron_refined> : <item:contenttweaker:neutron>;
    }
    return null;
}

function showRecipe(input as byte[][], core as IItemStack, out as IItemStack, isRefined as bool) {
    var inputBox as IIngredient[][] = [
        [null, null, null],
        [null, null, null],
        [null, null, null]
    ];
    for i in 0 .. 3 {
        for j in 0 .. 3 {
            inputBox[i][j] = getModule(input[i][j], isRefined);
        }
    }
    inputBox[1][1] = core;
    recipes.addShaped(out, inputBox, 
        function(out, ins, info) {
            return null;
        } as IRecipeFunction,
        null
    );
}

for out, input in colliderRecipesOne {
    showRecipe(input, <item:contenttweaker:collider_lv1>, out, false);
}

for out, input in colliderRecipesTwo {
    showRecipe(input, <item:contenttweaker:collider_lv2>, out, false);
}

for out, input in colliderRecipesThree {
    showRecipe(input, <item:contenttweaker:collider_lv3>, out, true);
}

for out, input in colliderRecipesFour {
    showRecipe(input, <item:contenttweaker:collider_lv4>, out, true);
}