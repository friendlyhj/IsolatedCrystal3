import mods.zenutils.command.ZenCommand;
import mods.zenutils.command.ZenCommandTree;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.TabCompletion;
import crafttweaker.player.IPlayer;
import scripts.compatSkills.SkillLocker.stagesHaveRegistered;

val removeAllStages as ZenCommand = ZenCommand.create("removeallstages");
removeAllStages.getCommandUsage = function(sender) {
    return "commands.removeallstages.usage";
};
removeAllStages.requiredPermissionLevel = 3;
removeAllStages.tabCompletion = TabCompletion.create(["player"]);
removeAllStages.execute = function(command, server, sender, args) {
    var player as IPlayer = null;
    if (args.length == 0) {
        player = CommandUtils.getCommandSenderAsPlayer(sender);
    } else if (args.length == 1) {
        player = CommandUtils.getPlayer(server, sender, args[0]);
    } else {
        CommandUtils.notifyWrongUsage(command, sender);
    }
    for stage in stagesHaveRegistered {
        player.removeGameStage(stage);
    }
};

val freshStage as ZenCommand = ZenCommand.create("freshstage");
freshStage.getCommandUsage = function(sender) {
    return "commands.freshstage.usage";
};
freshStage.requiredPermissionLevel = 3;
freshStage.tabCompletion = TabCompletion.create(["player"]);
freshStage.execute = function(command, server, sender, args) {
    var player as IPlayer = null;
    if (args.length == 0) {
        player = CommandUtils.getCommandSenderAsPlayer(sender);
    } else if (args.length == 1) {
        player = CommandUtils.getPlayer(server, sender, args[0]);
    } else {
        CommandUtils.notifyWrongUsage(command, sender);
    }
    player.update(player.data + {freshstage : true});
    sender.sendMessage(game.localize("commands.freshstage.success"));
};

ZenCommandTree.create("isolatedcrystal", freshStage, removeAllStages).register();
