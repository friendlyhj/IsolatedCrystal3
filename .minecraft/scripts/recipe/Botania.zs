import scripts.compatSkills.SkillLocker;
import scripts.compatSkills.Utils.getSkillArray;
import crafttweaker.item.IItemDefinition;

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
