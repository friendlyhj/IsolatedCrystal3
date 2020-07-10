#priority 200
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.events.IEventManager;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;

static isInvalid as bool = false;

static invalidMods as string[] = [
    "torcherino",
    "projecte"
];

for i in invalidMods {
    if (loadedMods in i) {
        isInvalid = true;
        break;
    }
}

events.onPlayerTick(function(event as PlayerTickEvent) {
    val player as IPlayer = event.player;
    val world as IWorld = player.world;

    if (isInvalid && world.remote) {
        if (world.time % 100 == 0) {
            player.sendStatusMessage(format.red("检测到你安装了非法模组！"), true);
        }
        if (world.time % 100 == 50) {
            player.sendStatusMessage(format.red("你依旧可以进行游戏，但极不推荐！"), true);
        }
    }
});