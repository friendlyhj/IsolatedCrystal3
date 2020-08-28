#loader crafttweaker
import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.player.IPlayer;
import mods.zenutils.I18n;

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    val world as IWorld = event.world;
    val player as IPlayer = event.player;
    if (!world.remote && !isNull(player.currentItem) && player.currentItem.definition.id == "botania:twigwand" && event.block.definition.id.contains("modulardiversity:blockmana")) {
        val data as IData = world.getBlock(event.x, event.y, event.z).data;
        player.sendStatusMessage(I18n.format("isc.message.mana_hatch_displayer", [data.mana.asString()]), false);
    }
});