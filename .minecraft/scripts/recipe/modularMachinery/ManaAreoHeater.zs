#priority 70
import mods.modularmachinery.RecipeBuilder;

RecipeBuilder.newBuilder("mana_aeroheater_work", "mana_aeroheater", 10)
.addManaInput(100)
.addHotAirOutput(30, 180, 180)
.build();