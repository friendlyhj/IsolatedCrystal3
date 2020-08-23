#priority 2300
import crafttweaker.player.IPlayer;

zenClass PlayerEventSnippet {
    zenConstructor(arg as string, arg1 as bool, arg2 as bool) {
        name = arg;
        isServer = arg1;
        isClient = arg2;
    }
    val name as string;
    val onRun as function(IPlayer)void;
    val isServer as bool;
    val isClient as bool;
}