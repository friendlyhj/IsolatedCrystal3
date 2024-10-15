import mods.botaniatweaks.Agglomeration;
import mods.botaniatweaks.AgglomerationRecipe;
import mods.botaniatweaks.AgglomerationMultiblock;

Agglomeration.addRecipe(<minecraft:gunpowder>, [<contenttweaker:heated_crystal>], 20000, 0xffffff, 0xff5400, <extrautils2:compressedcobblestone>, <immersiveengineering:sheetmetal:9>, <immersiveengineering:sheetmetal:9>, <liquid:lava>, <immersiveengineering:sheetmetal:9>, <immersiveengineering:sheetmetal:9>);
Agglomeration.addRecipe(
    AgglomerationRecipe.create()
        .inputs(<contenttweaker:mana_essence>, <minecraft:potion>.withTag({Potion: "minecraft:water"}))
        .output(<contenttweaker:ocean_crystal>)
        .color1(0xffffff)
        .color2(0x3344ff)
        .manaCost(24000)
        .multiblock(
            AgglomerationMultiblock.create()
                .center(<minecraft:stonebrick>)
                .edge(<liquid:water>)
                .corner(<minecraft:stonebrick>)
                .consumeEdge()
        )
);