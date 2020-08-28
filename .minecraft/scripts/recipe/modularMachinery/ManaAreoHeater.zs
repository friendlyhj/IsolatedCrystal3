import mods.modularmachinery.RecipeBuilder;

RecipeBuilder.newBuilder("work", "mana_aeroheater", 10)
.addManaInput(500)
.addHotAirOutput(180, 30, 180)
.build();