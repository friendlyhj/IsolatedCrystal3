#priority 240
import scripts.compatSkills.SkillStack.SkillStack;
import crafttweaker.player.IPlayer;
import mods.compatskills.Skill;
import mods.compatskills.PlayerSkillInfo;
import mods.ctutils.commands.Commands;
import crafttweaker.command.ICommandSender;
import scripts.compatSkills.EnumSkill;

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

function levelUp(player as IPlayer, skill as Skill, newLevel as int) {
    val info as PlayerSkillInfo = player.skillData.getSkillInfo(skill);
    val ser as ICommandSender = Commands.getServerCommandSender();
    if (info.level == newLevel - 1) {
        server.commandManager.executeCommand(ser, "/reskillable incrementskill " ~ player.name ~ " " ~ skill.key ~ " 1");
    }
    player.update(player.data + {freshstage: true});
}

function getSkillArray(code as string) as SkillStack[] {
    var temp as SkillStack[] = [];
    for i in 0 .. code.length {
        if (i % 2 == 0) {
            val s as string = code[i];
            val l as string = code[i + 1];
            // 为什么不能直接 string 转 int 啊！！！
            val n as int = (
                (l == "1") ? 1 :
                (l == "2") ? 2 :
                (l == "3") ? 3 :
                (l == "4") ? 4 :
                (l == "5") ? 5 :
                (l == "6") ? 6 :
                (l == "7") ? 7 :
                (l == "8") ? 8 :
                (l == "9") ? 9 :
                (l == "a") ? 10 :
                (l == "b") ? 11 :
                (l == "c") ? 12 : 0
            );
            temp += SkillStack(EnumSkill.getSkillByAlias(s), n);
        }
    }
    return temp;
}