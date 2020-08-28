import mods.modularmachinery.RecipeBuilder;

RecipeBuilder.newBuilder("work", "mana_aeroheater", 10)
.addManaInput(300)
.addHotAirOutput(180, 30, 180)
.build();