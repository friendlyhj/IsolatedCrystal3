#priority -30

import scripts.compatSkills.SkillLocker.stageSkillMap;
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.player.IPlayer;
import mods.compatskills.playerData;

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    if (player.world.remote) return;
    val skillData as playerData = player.skillData;

    for stage, skills in stageSkillMap {
        var achieve as bool = true;
        for skill in skills {
            achieve &= (skillData.getSkillInfo(skill.skill).getLevel() >= skill.level);
            if (!achieve) break;
        }
        if (achieve && !player.hasGameStage(stage)) {
            player.addGameStage(stage);
            print("Add " ~ stage ~ " Stage to Player " ~ player.name);
            return;
        }
    }
});