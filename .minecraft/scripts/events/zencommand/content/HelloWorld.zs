import scripts.events.zencommand.ZenCommand.ZenCommand;
import scripts.events.zencommand.ZenCommandRegistrar;
import crafttweaker.command.ICommandSender;

val helloWorld as ZenCommand = ZenCommand("helloworld");
helloWorld.onExecute = function(sender as ICommandSender, paras as string[]) as void {
    sender.sendMessage("hello, world!");
};
ZenCommandRegistrar.register(helloWorld);