#reloadable
#priority 100

import scripts.libs.Util.toUpperCamelCase;
import crafttweaker.item.IItemStack;

<ore:blockCoal>.remove(<minecraft:coal_block> * 8);
<ore:blockCoal>.add(<minecraft:coal_block>);

<ore:blockCertus>.add(<appliedenergistics2:quartz_block>);
<ore:meatRaw>.add(<minecraft:porkchop>);

val toUnifyMetals as string[] = [
    "aluminum",
    "copper",
    "tin",
    "lead",
    "nickel",
    "platinum",
    "silver",
    "uranium",
    "bronze",
    "steel",
    "invar",
    "electrum",
    "constantan"
];

val modPreference as string[] = [
    "thermalfoundation",
    "enderio",
    "immersiveengineering",
    "nuclearcraft",
    "mekanism"
];

val parts as string[] = [
    "ingot",
    "nugget",
    "block"
];

function indexOf(array as string[], value as string) as int {
    for i, v in array {
        if (v == value) {
            return i;
        }
    }
    return -1;
}

for metal in toUnifyMetals {
    for part in parts {
        val ore = <ore:${part}${toUpperCamelCase(metal)}>;
        var bestItem as IItemStack = null;
        var bestIndex as int = 100;
        for item in ore.items {
            var modIndex = indexOf(modPreference, item.definition.owner);
            if (modIndex != -1) {
                if (modIndex < bestIndex) {
                    bestItem = item;
                    bestIndex = modIndex;
                }
            }
        }
        if (!isNull(bestItem)) {
            for item in ore.items {
                if (!bestItem.matches(item)) {
                    mods.jei.JEI.removeAndHide(item);
                }
            }
        }
    }
}
