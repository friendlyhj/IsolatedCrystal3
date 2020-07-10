#priority 2900
import scripts.events.zencommand.ZenCommand.ZenCommand;
import crafttweaker.events.IEventManager;
import crafttweaker.event.CommandEvent;

static commandMap as ZenCommand[string] = {};

function register(command as ZenCommand) {
    commandMap[command.name] = command;
}

events.onCommand(function(event as CommandEvent) {
    if (isNull(event.command) || event.parameters.length == 0 || event.command.name != "crafttweaker") return;
    for name, command in commandMap {
        if (event.parameters[0] == command.name) {
            event.cancel();
            command.onExecute(event.commandSender, event.parameters);
        }
    }
});