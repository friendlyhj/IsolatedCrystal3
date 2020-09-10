import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.prodigytech.magneticreassembler;
import mods.jei.JEI;

// 导电铁
magneticreassembler.addRecipe(<ore:ingotSteel>, <ore:ingotConductiveIron>.firstItem);

// ban 合金炉与 SAG 磨粉机
JEI.removeAndHide(<item:enderio:block_sag_mill>);
JEI.removeAndHide(<item:enderio:block_alloy_smelter>);
JEI.removeAndHide(<item:enderio:block_simple_sag_mill>);
JEI.removeAndHide(<item:enderio:block_simple_alloy_smelter>);
JEI.removeAndHide(<item:enderio:block_enhanced_alloy_smelter>);
JEI.removeAndHide(<item:enderio:block_enhanced_sag_mill>);
