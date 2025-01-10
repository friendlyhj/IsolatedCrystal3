#reloadable

import mods.immersiveengineering.Blueprint;
import mods.immersiveengineering.BlastFurnace;
import mods.immersiveengineering.ArcFurnace;

Blueprint.addRecipe("modules", <contenttweaker:item_module>, [
    <appliedenergistics2:material:25>,
    <ore:plateIron>,
    <ore:plateBronze>,
    <immersiveengineering:treated_wood>
]);

Blueprint.addRecipe("modules", <contenttweaker:network_module>, [
    <appliedenergistics2:material:25>,
    <botania:manaresource:23>,
    <appliedenergistics2:material:7>,
    <appliedenergistics2:material:7>
]);

Blueprint.addRecipe("modules", <contenttweaker:advanced_network_module>, [
    <appliedenergistics2:material:28>,
    <fluxnetworks:fluxcore>,
    <contenttweaker:logic_crystal>,
    <contenttweaker:logic_crystal>
]);

Blueprint.addRecipe("modules", <contenttweaker:crafting_module>, [
    <appliedenergistics2:material:25>,
    <botania:dreamwood>,
    <contenttweaker:crafting_crystal>,
    <contenttweaker:crafting_crystal>

]);

Blueprint.addRecipe("modules", <contenttweaker:write_module>, [
    <appliedenergistics2:material:25>,
    <ore:plateNickel>,
    <factorytech:machinepart:130>,
    <factorytech:machinepart:130>
]);

Blueprint.addRecipe("modules", <contenttweaker:usb_module>, [
    <appliedenergistics2:material:25>,
    <ore:ingotInvar>,
    <appliedenergistics2:material>,
    <appliedenergistics2:material>,
]);

Blueprint.addRecipe("modules", <contenttweaker:liquid_module>, [
    <appliedenergistics2:material:28>,
    <astralsorcery:itemcraftingcomponent>,
    <contenttweaker:ocean_crystal>,
    <contenttweaker:ocean_crystal>,
]);

Blueprint.addRecipe("modules", <contenttweaker:gas_module>, [
    <appliedenergistics2:material:28>,
    <ore:plateGold>,
    <ore:ingotOsmium>,
    <ore:ingotOsmium>,
]);

Blueprint.addRecipe("modules", <contenttweaker:world_module>, [
    <appliedenergistics2:material:28>,
    <minecraft:piston>,
    <contenttweaker:destruction_crystal>,
    <contenttweaker:destruction_crystal>
]);

Blueprint.addRecipe("modules", <appliedenergistics2:material:26>, [
    <appliedenergistics2:material:25>,
    <ore:plateSignalum>,
    <ore:ingotRedAlloy>,
    <ore:ingotRedAlloy>,
]);

Blueprint.removeRecipe(<immersiveengineering:mold:1>);
BlastFurnace.addRecipe(<appliedenergistics2:material:5>, <contenttweaker:sand_dust>, 80);
ArcFurnace.removeRecipe(<enderio:item_alloy_ingot:4>);

