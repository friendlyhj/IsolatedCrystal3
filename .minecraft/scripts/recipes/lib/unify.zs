#loader crafttweaker

import mods.ooi.ConversionItem;
import mods.ooi.ConversionFluid;
import mods.ooi.BlackList;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

<ore:blockCoal>.remove(<minecraft:coal_block> * 8);
<ore:blockCoal>.add(<minecraft:coal_block>);

<ore:blockCertus>.add(<appliedenergistics2:quartz_block>);
<ore:meatRaw>.add(<minecraft:porkchop>);
<ore:nuggetIron>.add(<minecraft:iron_nugget>);

<ore:ingotConstantan>.add(<factorytech:ingot:2>);
<ore:blockConstantan>.add(<factorytech:oreblock:2>);

val b as string[] = [
    "stickWood"
];

BlackList.addMatchItem("chisel");

static modPreference as string[] = [
    "minecraft",
    "thermalfoundation",
    "enderio",
    "immersiveengineering",
    "nuclearcraft",
    "mekanism"
];

function getPreferredItem(od as IOreDictEntry) as IItemStack {
    var bestItem as IItemStack = od.firstItem;
    var bestIndex as int = 100;
    for item in od.items {
        var modIndex = modPreference.indexOf(item.definition.owner);
        if (modIndex != -1) {
            if (modIndex < bestIndex) {
                bestItem = item;
                bestIndex = modIndex;
            }
        }
    }
    return bestItem;
}

for od in oreDict.entries {
    var odName = od.name;
    if (odName.startsWith("ore") 
        || odName.startsWith("dust")
        || odName.startsWith("ingot")
        || odName.startsWith("gem")
        || odName.startsWith("nugget")
        || odName.startsWith("plate")
        || odName.startsWith("gear")
        || odName.startsWith("stick")
    ){
        if (b has odName)continue;
        ConversionItem.create(getPreferredItem(od))
            .addMatchItem(od)
            .register();
        if (odName.startsWith("gem")){
            val od0 = oreDict.get("block" + odName.substring("gem".length));
            if (!od0.empty){
                ConversionItem.create(getPreferredItem(od0))
                    .addMatchItem(od0)
                    .register();
            }
        } else if (odName.startsWith("ingot")){
            val od0 = oreDict.get("block" + odName.substring("ingot".length));
            if (!od0.empty){
                ConversionItem.create(getPreferredItem(od0))
                    .addMatchItem(od0)
                    .register();
            }
        }
    }
}

ConversionItem.create(<appliedenergistics2:material:5>)
    .addMatchItem(<ore:itemSilicon>)
    .register();

ConversionItem.create(<thermalfoundation:material:802>)
    .addMatchItem(<immersiveengineering:material:6>)
    .register();

ConversionItem.create(<thermalfoundation:storage_resource:1>)
    .addMatchItem(<immersiveengineering:stone_decoration:3>)
    .register();

ConversionItem.create(<thermalfoundation:material:864>)
    .addMatchItem(<immersiveengineering:material:7>)
    .register();

ConversionItem.create(<thermalfoundation:storage_resource>)
    .addMatchItem(<ore:blockCharcoal>)
    .register();

// ConversionItem.create(<thermalfoundation:material:164>)
//     .addMatchItem(<factorytech:ingot:2>)
//     .register();

// ConversionItem.create(<thermalfoundation:storage_alloy:4>)
//     .addMatchItem(<factorytech:oreblock:2>)
//     .register();

// ConversionItem.create(<thermalfoundation:material:100>)
//     .addMatchItem(<factorytech::3>)
//     .register();
