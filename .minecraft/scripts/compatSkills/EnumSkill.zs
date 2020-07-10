#priority 480
#ignoreBracketErrors
import mods.compatskills.Skill;
import scripts.grassUtils.Logger;

static MACHINERY as Skill = <skill:compatskills:machinery>;
static MAGIC as Skill = <skill:reskillable:magic>;

function getSkill(name as string) as Skill {
    if (name.contains("machinery")) return MACHINERY;
    if (name.contains("magic")) return MAGIC;   

    Logger.sendError("Not found skill: " ~ name ~ " !");
    return null;
}

