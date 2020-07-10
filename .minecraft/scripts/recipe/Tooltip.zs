#priority -10
import crafttweaker.item.IItemStack;
import crafttweaker.item.ITooltipFunction;
import scripts.grassUtils.GrassUtils;

<item:contenttweaker:advanced_infinite_fruit>.addShiftTooltip(function(item) {
    if (item.tag has "SoulbindName") {
        return GrassUtils.i18nValued("botaniamisc.relicSoulbound", [item.tag.SoulbindName.asString()]).replace("&", "§");
    } else {
        return GrassUtils.i18n("botaniamisc.relicUnbound").replace("&", "§");
    }
}, function(item) {
    return GrassUtils.i18n("botaniamisc.shiftinfo").replace("&", "§");
});