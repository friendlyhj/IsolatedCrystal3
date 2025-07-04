#reloadable

import mods.fluidintetweaker.FITweaker;
import mods.fluidintetweaker.interaction.Condition;

static sandRecipe as [string] = FITweaker.addRecipe(
    <liquid:lava>,
    <liquid:astralsorcery.liquidstarlight>,
    FITweaker.outputBuilder()
        .addEvent(
            FITweaker.eventBuilder()
                .createSetBlockEvent(<blockstate:minecraft:sand>)
        )
        .addEvent(
            FITweaker.eventBuilder()
                .createSetBlockEvent(<blockstate:astralsorcery:blockcustomsandore>)
                .addCondition(Condition.byChance, [1.0f / 900.0f])
        )
);

FITweaker.addRecipe(
    <liquid:water>,
    <liquid:astralsorcery.liquidstarlight>,
    <blockstate:minecraft:ice>
);

FITweaker.addRecipe(
    <liquid:petrotheum>,
    <liquid:astralsorcery.liquidstarlight>,
    <blockstate:minecraft:gravel>
);
