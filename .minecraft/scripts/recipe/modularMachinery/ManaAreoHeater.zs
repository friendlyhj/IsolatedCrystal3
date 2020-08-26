import mods.modularmachinery.RecipeBuilder;

RecipeBuilder.newBuilder("work", "mana_aeroheater", 10)
    .addManaInput(1000)
    .addHotAirOutput(150, 30, 150)
    .build();