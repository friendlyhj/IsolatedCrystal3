// by: youyihj
#loader crafttweaker
#priority 450

import scripts.grassUtils.StringHelper;
import scripts.grassUtils.GrassUtils;
import crafttweaker.oredict.IOreDict;

for item in loadedMods["contenttweaker"].items {
    val name as string = item.definition.id;
    if (name.contains("booster")) {
        val type as string = name.split("_")[1];
        oreDict.get("booster" ~ StringHelper.toUpperCamelCase(type)).add(item);
        val langKey as string = "tile.contenttweaker.booster_" ~ type ~ ".name";
        game.setLocalization("en_us", "base.material." ~ type, StringHelper.toUpperCamelCase(type));
        val langType as string = game.localize("base.material." ~ type);
        game.setLocalization(client.language, langKey, GrassUtils.i18nValued("contenttweaker.part.booster", [langType]));
    }
}