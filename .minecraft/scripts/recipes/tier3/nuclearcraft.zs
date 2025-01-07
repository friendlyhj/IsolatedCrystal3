import mods.nuclearcraft.IngotFormer;
import mods.nuclearcraft.Manufactory;
import mods.nuclearcraft.RockCrusher;
import mods.nuclearcraft.AlloyFurnace;
import mods.nuclearcraft.SaltMixer;
import mods.nuclearcraft.ChanceItemIngredient;

IngotFormer.addRecipe(<liquid:poly_lactic_acid> * 80, <nuclearcraft:part:6>);
Manufactory.removeRecipeWithOutput(<nuclearcraft:part:6>);
RockCrusher.addRecipe(<ore:stoneLimestone>, <minecraft:dye:15>, ChanceItemIngredient.create(<nuclearcraft:dust:5>, 60), ChanceItemIngredient.create(<nuclearcraft:dust:7>, 30));
AlloyFurnace.removeRecipeWithOutput(<nuclearcraft:alloy:1> * 2);
AlloyFurnace.addRecipe(<contenttweaker:metal_crystal>, <nuclearcraft:ingot:5> * 5, <nuclearcraft:alloy:1> * 6);
SaltMixer.removeRecipeWithOutput(<liquid:tough> * 144);
SaltMixer.addRecipe(<liquid:metal_crystal_liquid> * 144, <liquid:boron> * 720, <liquid:tough> * 864);
SaltMixer.addRecipe(<liquid:tin> * 3, <liquid:lead> * 2, <liquid:soldering> * 5);
SaltMixer.addRecipe(<liquid:mithril> * 72, <liquid:flibe> * 72, <liquid:mine_medium> * 100);
