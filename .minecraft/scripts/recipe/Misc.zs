import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.botania.ManaInfusion;
import mods.botania.ElvenTrade;

recipes.addShapeless("soldering_worktable", <volumetricflask:volumetric_flask_144>.withTag({Fluid: {FluidName: "soldering", Amount: 144}}),
[<volumetricflask:volumetric_flask_144>, <ore:ingotSoldering>, <item:contenttweaker:soldering_manasteel>.transformDamage(3)]);

recipes.addShapeless("fxxk_ender_air", <item:minecraft:glass_bottle>, [<item:botania:manaresource:15>]);

// seeds
ManaInfusion.removeRecipe(<item:minecraft:wheat_seeds>);
ManaInfusion.removeRecipe(<item:minecraft:potato>);
ManaInfusion.removeRecipe(<item:minecraft:carrot>);
ManaInfusion.removeRecipe(<item:minecraft:beetroot_seeds>);
ManaInfusion.removeRecipe(<item:minecraft:melon_seeds>);
ManaInfusion.removeRecipe(<item:minecraft:pumpkin_seeds>);
ManaInfusion.removeRecipe(<item:minecraft:dye:3>);

val allSeeds as IItemStack[] = [
    <item:minecraft:wheat_seeds>,
    <item:inspirations:potato_seeds>,
    <item:inspirations:carrot_seeds>,
    <item:minecraft:beetroot_seeds>,
    <item:minecraft:pumpkin_seeds>,
    <item:minecraft:melon_seeds>,
    <item:inspirations:cactus_seeds>,
    <item:inspirations:sugar_cane_seeds>,
    <item:rustic:grape_stem>,
    <item:rustic:tomato_seeds>,
    <item:rustic:chili_pepper_seeds>,
    <item:rustic:aloe_vera>,
    <item:rustic:blood_orchid>,
    <item:rustic:chamomile>,
    <item:rustic:cohosh>,
    <item:rustic:deathstalk_mushroom>,
    <item:rustic:horsetail>,
    <item:rustic:mooncap_mushroom>,
    <item:rustic:wind_thistle>,
    <item:rustic:cloudsbluff>,
    <item:rustic:core_root>,
    <item:rustic:ginseng>,
    <item:rustic:marsh_mallow>,
    <item:minecraft:dye:3>,
    <item:immersiveengineering:seed>,
    <item:actuallyadditions:item_canola_seed>,
    <item:actuallyadditions:item_flax_seed>,
    <item:actuallyadditions:item_coffee_seed>
];

for i, seed in allSeeds {
    if (i == 0) {
        ManaInfusion.addAlchemy(seed, allSeeds[allSeeds.length - 1], 800);
    } else {
        ManaInfusion.addAlchemy(seed, allSeeds[i - 1], 800);
    }
}

ElvenTrade.addRecipe([<item:rustic:sapling>], [<ore:treeSapling>]);

for seed in vanilla.seeds.seeds {
    if (seed.stack.definition.id == "minecraft:wheat_seeds") continue;
    vanilla.seeds.removeSeed(seed.stack);
}
