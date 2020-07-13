#priority 2300
import crafttweaker.player.IPlayer;

zenClass PlayerEventSnippet {
    zenConstructor(arg as string) {
        name = arg;
    }
    val name as string;
    val onRun as function(IPlayer)void;
}