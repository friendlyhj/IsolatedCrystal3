#priority 3000
import crafttweaker.command.ICommandSender;

zenClass ZenCommand {
    zenConstructor(arg as string) {
        name = arg;
    }

    val name as string;
    val onExecute as function(ICommandSender, string[])void;
}
