#priority 240
import scripts.compatSkills.SkillStack.SkillStack;
import crafttweaker.player.IPlayer;
import mods.compatskills.Skill;
import mods.compatskills.PlayerSkillInfo;
import mods.ctutils.commands.Commands;
import crafttweaker.command.ICommandSender;

function toAllSkill(skills as SkillStack[]) as string[] {
    val skillsString as string[string] = {};
    for skill in skills {
        skillsString[skill.id] = skill.toString();
    }
    return skillsString.values;
}

function getStage(skills as SkillStack[]) as string {
    var stage as string = "skill";
    for skill in skills {
        stage ~= ("|" ~ skill.id ~ "_" ~ skill.level);
    }
    return stage;
}

function toAllSkillM(skills as SkillStack[int]) as string[] {
    val skillsString as string[string] = {};
    for num, skill in skills {
        skillsString[skill.id] = skill.toString();
    }
    return skillsString.values;
}

function levelUp(player as IPlayer, skill as Skill, originLevel as int, newLevel as int) {
    val info as PlayerSkillInfo = player.skillData.getSkillInfo(skill);
    val ser as ICommandSender = Commands.getServerCommandSender();
    if (info.level == originLevel) {
        for i in originLevel .. newLevel {
            server.commandManager.executeCommand(ser, "/reskillable incrementskill " ~ player.name ~ " " ~ skill.key ~ " 1");
        }
    }
}
