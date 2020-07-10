#priority 450
import mods.compatskills.Skill;
import scripts.grassUtils.Logger;

zenClass SkillStack {
    zenConstructor(skillArg as Skill, levelArg as int) {
        skill = skillArg;
        level = levelArg;
        domain = skillArg.key.split("\\.")[0];
        id = skillArg.key.split("\\.")[1];
    }
    
    val skill as Skill;
    val level as int;
    val domain as string;
    val id as string;

    function toString() as string {
        return this.domain ~ ":" ~ this.id ~ "|" ~ this.level;
    }
}

function getSkillStack(skill as Skill, level as int) as SkillStack {
    return SkillStack(skill, level);
}