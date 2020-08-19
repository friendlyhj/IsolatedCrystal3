#norun

import scripts.events.zencommand.ZenCommand.ZenCommand;
import scripts.events.zencommand.ZenCommandRegistrar;
import crafttweaker.command.ICommandSender;
import crafttweaker.player.IPlayer;
import scripts.compatSkills.SkillLocker.stagesHaveRegistered;

val removeAllStages as ZenCommand = ZenCommand("removeallstages");
removeAllStages.onExecute = function(sender as ICommandSender, args as string[]) as void {
    if (sender instanceof IPlayer) {
        val player as IPlayer = sender;
        for stage in stagesHaveRegistered {
            player.removeGameStage(stage);
        }
    }
    sender.sendMessage("isc.command.removeallstages");
};
ZenCommandRegistrar.register(removeAllStages);