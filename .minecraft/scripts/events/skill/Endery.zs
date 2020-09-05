#priority 210
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.event.EnderTeleportEvent;
import scripts.compatSkills.Utils.levelUp;
import scripts.compatSkills.EnumSkill.ENDERY;

events.onEnderTeleport(function(event as EnderTeleportEvent) {
    if (event.entityLivingBase instanceof IPlayer) {
        val player as IPlayer = event.entityLivingBase;
        if (player.world.remote) return;
        levelUp(player, ENDERY, 2);
    }
});