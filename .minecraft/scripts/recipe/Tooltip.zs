#priority -10
import crafttweaker.item.IItemStack;
import crafttweaker.item.ITooltipFunction;
import crafttweaker.player.IPlayer;
import mods.zenutils.UUID;
import mods.zenutils.I18n;

<item:contenttweaker:advanced_infinite_fruit>.addShiftTooltip(function(item) {
    if (item.tag has "soulbindUUID") {
        val player as IPlayer = client.player;
        if (player.getUUID() == UUID.fromString(item.tag.soulbindUUID.asString())) {
            return I18n.format("botaniamisc.relicSoulbound", player.name).replace("&", "§");
        } else {
            return game.localize("botaniamisc.notYourSagittarius").replace("&", "§");
        }
    } else {
        return I18n.format("botaniamisc.relicUnbound", []).replace("&", "§");
    }
}, function(item) {
    return I18n.format("botaniamisc.shiftinfo", []).replace("&", "§");
});