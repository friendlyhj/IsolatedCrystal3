#reloadable

import mods.botania.OrechidIgnem;
import mods.botania.Apothecary;

for od in native.vazkii.botania.api.BotaniaAPI.oreWeightsNether {
    OrechidIgnem.removeOre(od);
}

<ore:oreEmber>.add(<contenttweaker:ember_ore>);

OrechidIgnem.addOre("oreQuartz", 20);
OrechidIgnem.addOre("oreEmber", 12);
OrechidIgnem.addOre("oreArdite", 1);
OrechidIgnem.addOre("oreCobalt", 1);

Apothecary.removeRecipe("orechidIgnem");
Apothecary.addRecipe(<botania:specialflower>.withTag({type: "orechidIgnem"}), [
    <ore:petalRed>,
    <ore:petalRed>,
    <ore:petalWhite>,
    <ore:petalPink>,
    <ore:petalMagenta>,
    <contenttweaker:aura_crystal>,
    <contenttweaker:aura_crystal>,
    <contenttweaker:blood_crystal>,
    <enderio:item_material:74>,
    <botania:rune:11>,
    <botania:rune:15>,
    <naturesaura:token_rage>
]);
