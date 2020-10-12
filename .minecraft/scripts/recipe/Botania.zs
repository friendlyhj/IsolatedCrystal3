import scripts.compatSkills.SkillLocker;
import scripts.compatSkills.Utils.getSkillArray;
import crafttweaker.item.IItemDefinition;
import mods.botania.RuneAltar;

// 花肥 植物学1级
SkillLocker.lockItem(<item:botania:fertilizer>, getSkillArray("b1"));

// 花药台 植物学2级
SkillLocker.lockRecipeWithStage("botania:altar_0", getSkillArray("b2"));

val altar as IItemDefinition = <item:botania:altar>.definition; 
for i in 0 .. 9 {
    SkillLocker.lockItem(altar.makeStack(i), getSkillArray("b2"));
}

// 森林法杖 植物学2级
SkillLocker.lockItem(<item:botania:twigwand>, getSkillArray("b2"));

// 魔力发射器 植物学3级
SkillLocker.lockItem(<item:botania:spreader>, getSkillArray("b3t2"));

// 泰拉凝聚板 植物学4级 能源学3级
SkillLocker.lockItem(<item:botania:terraplate>, getSkillArray("b4n3"));

// 火花
SkillLocker.tweakLockedRecipe(true, <item:botania:spark> * 4, [
    [null, <ore:dustEnder>, null],
    [<ore:dustBlaze>, <ore:dustGold>, <ore:dustBlaze>],
    [null, <ore:dustEnder>, null]
], getSkillArray("b4n3"));

// 精灵传送门
SkillLocker.tweakLockedRecipe(true, <item:botania:alfheimportal>, [
    [<ore:livingwood>, <ore:nuggetTerrasteel>, <ore:livingwood>],
    [<ore:obsidian>, <ore:nuggetTerrasteel>, <ore:obsidian>],
    [<ore:livingwood>, <ore:nuggetTerrasteel>, <ore:livingwood>]
], getSkillArray("b5e4"));

// 盖亚水晶
SkillLocker.tweakLockedRecipe(true, <item:botania:pylon:2>, [
    [null, <ore:elvenPixieDust>, null],
    [<ore:ingotElvenElementium>, <item:botania:pylon:1>, <ore:ingotElvenElementium>],
    [null, <ore:elvenPixieDust>, null]
], getSkillArray("b6"));

// 多媒体
recipes.remove(<item:botania:corporeaspark>);
recipes.remove(<item:botania:corporeaspark:1>);
RuneAltar.addRecipe(<item:botania:corporeaspark>, [<item:botania:spark>, <item:botania:manaresource:8>, <item:botania:manaresource:8>, <item:botania:manaresource:15>, <item:botania:manaresource:15>, <item:botania:manaresource:15>, <item:botania:rune:8>, <item:botania:rune:12>], 50000);
RuneAltar.addRecipe(<item:botania:corporeaspark:1>, [<item:botania:corporeaspark>, <ore:eternalLifeEssence>, <ore:eternalLifeEssence>, <ore:nuggetTerrasteel>, <ore:nuggetTerrasteel>, <ore:nuggetTerrasteel>, <ore:nuggetTerrasteel>, <ore:nuggetTerrasteel>, <ore:nuggetTerrasteel>], 200000);

for item in itemUtils.getItemsByRegexRegistryName("^botania:corporea.*") {
    SkillLocker.lockItem(item, getSkillArray("b7e5"));
}
