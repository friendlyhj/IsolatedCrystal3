import scripts.compatSkills.Utils.levelUp;
import scripts.events.zencommand.ZenCommand.ZenCommand;
import scripts.events.zencommand.ZenCommandRegistrar;
import crafttweaker.command.ICommandSender;
import crafttweaker.player.IPlayer;

val freshStage as ZenCommand = ZenCommand("freshstage");
freshStage.onExecute = function(sender as ICommandSender, paras as string[]) as void {
    if (sender instanceof IPlayer) {
        val player as IPlayer = sender;
        player.update(player.data + {freshstage : true});
    }
};
ZenCommandRegistrar.register(freshStage);