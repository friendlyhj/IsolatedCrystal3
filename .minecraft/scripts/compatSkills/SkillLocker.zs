#priority 230
import scripts.compatSkills.SkillStack.SkillStack;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.compatskills.Requirement;
import mods.compatskills.ModLock;
import mods.compatskills.GameStageLocks;
import mods.ItemStages;
import mods.recipestages.Recipes;
import scripts.compatSkills.Utils.toAllSkill;
import scripts.compatSkills.Utils.toAllSkillM;
import scripts.compatSkills.Utils.getStage;
import scripts.grassUtils.StringHelper;

static stageSkillMap as SkillStack[][string] = {};
static stagesHaveRegistered as string[] = [];
static tweakedRecipesAmount as int = 0;

function lockItem(item as IItemStack, skills as SkillStack[]) as int {
    Requirement.addRequirement(item, toAllSkill(skills));
    return 0;
}

function lockItemM(item as IItemStack, skills as SkillStack[int]) as int {
    Requirement.addRequirement(item, toAllSkillM(skills));
    return 0;
}

function lockMod(modid as string, skills as SkillStack[]) as int {
    ModLock.addModLock(modid, toAllSkill(skills));
    return 0;
}

function lockStage(stage as string, skills as SkillStack[]) as int {
    // GameStageLocks.addGameStageLock(stage, toAllSkill(skills));
    /* if (stagesHaveRegistered.length > 0) {
        for stageReg in stagesHaveRegistered {
            if (stage == stageReg) return 1;
        }
    } */
    if (stagesHaveRegistered has stage) return 1;
    stageSkillMap[stage] = skills;
    stagesHaveRegistered += stage;
    return 0;
}

function lockItemWithStage(item as IItemStack, skills as SkillStack[]) as string {
    val stage as string = getStage(skills);
    lockStage(stage, skills);
    ItemStages.addItemStage(stage, item);
    lockItem(item, skills);
    Recipes.setRecipeStage(stage, item);
    return stage;
}

function lockRecipeWithStage(recipeName as string, skills as SkillStack[]) as string {
    val stage as string = getStage(skills);
    Recipes.setRecipeStage(stage, recipeName);
    lockStage(stage, skills);
    return stage;
}

function tweakLockedRecipe(isShaped as bool, out as IItemStack, input as IIngredient[][], skills as SkillStack[]) as string {
    var recipeName as string = StringHelper.getItemNameWithUnderline(out);
    val stage as string = getStage(skills);
    lockStage(stage, skills);
    lockItem(out, skills);
    if (out.hasTag) {
        recipeName ~= ("_withtag_" ~ tweakedRecipesAmount);
    }
    recipes.remove(out.withAmount(1),true);
    if (isShaped) {
        Recipes.addShaped(recipeName, stage, out, input);
    } else {
        Recipes.addShapeless(recipeName, stage, out, input[0]);
    }
    tweakedRecipesAmount += 1;
    return stage;
}