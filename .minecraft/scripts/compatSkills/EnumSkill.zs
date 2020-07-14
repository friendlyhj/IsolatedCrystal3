#priority 480
#ignoreBracketErrors
import mods.compatskills.Skill;
import scripts.grassUtils.Logger;

static MACHINERY as Skill = <skill:compatskills:machinery>;
static BOTANY as Skill = <skill:compatskills:botany>;
static ENDERY as Skill = <skill:compatskills:endery>;
static METALLURGY as Skill = <skill:compatskills:metallurgy>;
static ASTRONOMY as Skill = <skill:compatskills:astronomy>;
static ENERGISTICS as Skill = <skill:compatskills:energistics>;
static INFORMATICS as Skill = <skill:compatskills:informatics>;
static TRANSPORTICS as Skill = <skill:compatskills:transportics>;

function getSkill(name as string) as Skill {
    if (name.contains("machinery")) return MACHINERY;
    if (name.contains("botany")) return BOTANY;   
    if (name.contains("endery")) return ENDERY;
    if (name.contains("metallurgy")) return METALLURGY;
    if (name.contains("astronomy")) return ASTRONOMY;
    if (name.contains("energistics")) return ENERGISTICS;
    if (name.contains("informatics")) return INFORMATICS;
    if (name.contains("transportics")) return TRANSPORTICS;

    Logger.sendError("Not found skill: " ~ name ~ " !");
    return null;
}

function getSkillByAlias(alias as string) as Skill {
    if (alias == "m") return MACHINERY;
    if (alias == "b") return BOTANY;   
    if (alias == "e") return ENDERY;
    if (alias == "l") return METALLURGY;
    if (alias == "a") return ASTRONOMY;
    if (alias == "n") return ENERGISTICS;
    if (alias == "i") return INFORMATICS;
    if (alias == "t") return TRANSPORTICS;

    Logger.sendError("Not found skill: " ~ alias ~ " !");
    return null;
}

static allSkill as Skill[] = [
    MACHINERY,
    BOTANY,
    ENDERY,
    METALLURGY,
    ASTRONOMY,
    ENERGISTICS,
    INFORMATICS,
    TRANSPORTICS
];