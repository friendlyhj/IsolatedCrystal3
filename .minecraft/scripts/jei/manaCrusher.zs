#reloadable

import crafttweaker.item.IIngredient;
import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiUtils;
import scripts.events.manaCrusher;

JEI.createJei("mana_crusher", game.localize("tile.contenttweaker.mana_crusher.name"))
    .setBackground(IJeiUtils.createBackground(130, 30))
    .setIcon(<contenttweaker:mana_crusher>)
    .setModid("crafttweaker")
    .addRecipeCatalyst(<contenttweaker:mana_crusher>)
    .addSlot(IJeiUtils.createItemSlot("input", 0, 10, true))
    .addElement(IJeiUtils.createArrowElement(50, 10, 0))
    .addSlot(IJeiUtils.createItemSlot("output", 100, 10, false))
    .register();

for i, matcher in manaCrusher.Inputs {
    // TODO: handle percent and multiple outputs
    val recipe = JEI.createJeiRecipe("mana_crusher");
    var ingredient as IIngredient = null;
    for block in matcher.getMatchingBlockStates() {
        val item = itemUtils.getItem(block.block.definition.id, block.meta);
        if (!isNull(item)) {
            if (!isNull(ingredient)) {
                ingredient |= item;
            } else {
                ingredient = item;
            }
        }
    }
    recipe.addInput(ingredient);
    recipe.addOutput(manaCrusher.Outputs[i][0].stack);
    recipe.build();
}
