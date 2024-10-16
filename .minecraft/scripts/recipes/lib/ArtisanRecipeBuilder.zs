#reloadable
#priority 100
#debug

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockState;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.recipes.IRecipeAction;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import mods.artisanworktables.builder.RecipeBuilder as Artisan;
import mods.modularmachinery.RecipePrimer as ModularMachinery;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.IngredientArrayPrimer;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeStartEvent;

zenClass ArtisanRecipeBuilder {
    val artisan as Artisan;
    val mm as ModularMachinery;
    val outputs as int[IItemStack] = {};
    val extraOutputs as float[IItemStack] = {};

    zenConstructor(type as string, name as string) {
        artisan = scripts.libs.Util.getArtisanRecipeBuilder(type).setName(name);
        mm = mods.modularmachinery.RecipeBuilder.newBuilder(name, "mechanical_artisan", 120).addEnergyPerTickInput(100);
        val worktable = IBlockState.getBlockState("artisanworktables:worktable", "variant=" ~ type);
        mm.addCatalystInput(<artisanworktables:worktable>.withDamage(worktable.meta), [], []);
        mm.addPostCheckHandler(function(event as RecipeCheckEvent) {
            val controller = event.controller;
            val worktablePos = controller.pos.offset(IBlockPos.create(0, 1, 1).rotateYNorthUntil(controller.facing));
            if (controller.world.getBlockState(worktablePos) != worktable) {
                event.setFailed("Mismatched worktable");
            }
        });
    }

    function setShaped(inputs as IIngredient[][]) as ArtisanRecipeBuilder {
        artisan.setShaped(inputs);
        for item, count in countIngredients(inputs) {
            mm.addItemInput(item * count);
        }
        return this;
    }

    function setShapeless(inputs as IIngredient[]) as ArtisanRecipeBuilder {
        artisan.setShapeless(inputs);
        for item, count in countIngredients([inputs]) {
            mm.addItemInput(item * count);
        }
        return this;
    }

    function addTool(tool as IIngredient, damage as int) as ArtisanRecipeBuilder {
        artisan.addTool(tool, damage);
        mm.addCatalystInput(tool, ["-" ~ damage], []);
        mm.addPostCheckHandler(function(event as RecipeCheckEvent) {
            val controller = event.controller;
            val toolboxPos = controller.pos.offset(IBlockPos.create(-2, -1, 0).rotateYNorthUntil(controller.facing));
            for item in controller.world.getItemHandler(toolboxPos, up) {
                if (tool.matches(item)) {
                    return;
                }
            }
            event.setFailed("Missing Tool");
        });
        mm.addStartHandler(function(event as RecipeStartEvent) {
            val controller = event.controller;
            val toolboxPos = controller.pos.offset(IBlockPos.create(-2, -1, 0).rotateYNorthUntil(controller.facing));
            var toolSlotIndex = -1;
            var toolItem as IItemStack = null;
            val itemHandler = controller.world.getItemHandler(toolboxPos, up);
            for i, item in itemHandler {
                if (tool.matches(item)) {
                    toolSlotIndex = i;
                    toolItem = item;
                    break;
                }
            }
            if (toolSlotIndex != -1) {
                itemHandler.extractItem(toolSlotIndex, 1, false);
                val newDamage = toolItem.damage + damage;
                if (newDamage < toolItem.maxDamage) {
                    itemHandler.insertItem(toolSlotIndex, toolItem.withDamage(newDamage), false);
                }
            }
        });
        return this;
    }

    function addOutput(output as IItemStack, wight as int = 0) as ArtisanRecipeBuilder {
        artisan.addOutput(output, wight);
        outputs[output] = wight;
        return this;
    }

    function setFluid(liquid as ILiquidStack) as ArtisanRecipeBuilder {
        artisan.setFluid(liquid);
        mm.addFluidInput(liquid);
        return this;
    }

    function setSecondaryIngredients(items as IIngredient[]) as ArtisanRecipeBuilder {
        artisan.setSecondaryIngredients(items);
        mm.addItemInputs(items);
        return this;
    }

    function setExtraOutputOne(item as IItemStack, chance as float) as ArtisanRecipeBuilder {
        artisan.setExtraOutputOne(item, chance);
        extraOutputs[item] = chance;
        return this;
    }

    function setExtraOutputTwo(item as IItemStack, chance as float) as ArtisanRecipeBuilder {
        artisan.setExtraOutputTwo(item, chance);
        extraOutputs[item] = chance;
        return this;
    }

    function setExtraOutputThree(item as IItemStack, chance as float) as ArtisanRecipeBuilder {
        artisan.setExtraOutputThree(item, chance);
        extraOutputs[item] = chance;
        return this;
    }

    function setRecipeFunction(func as IRecipeFunction) as ArtisanRecipeBuilder {
        artisan.setRecipeFunction(func);
        // TODO: MM stuff
        return this;
    }

    function setRecipeAction(action as IRecipeAction) as ArtisanRecipeBuilder {
        artisan.setRecipeAction(action);
        // TODO: MM stuff
        return this;
    }

    function create() as void {
        artisan.create();
        if (outputs.length == 1) {
            mm.addItemOutput(outputs.keys[0]);
        } else {
            var totalWeight as int = 0;
            for item, weight in outputs {
                totalWeight += weight;
            }
            val primer = IngredientArrayBuilder.newBuilder();
            for item, weight in outputs {
                primer.addChancedIngredient(item, weight / (1.0f * totalWeight));
            }
            mm.addRandomItemOutput(primer);
        }
        for item, chance in extraOutputs {
            mm.addItemOutput(item).setChance(chance);
        }
        mm.build();
    }

    function countIngredients(inputs as IIngredient[][]) as int[IIngredient] {
        val result as int[IIngredient] = {};
        for row in inputs {
            for input in row {
                var flag as bool = false;
                if (!isNull(input)) {
                    for item, count in result {
                        if (item has input) {
                            result[item] = count + 1;
                            flag = true;
                            break;
                        }
                    }
                    if (!flag) {
                        result[input] = 1;
                    }
                }
            }
        }
        return result;
    }
}

static noNameId as int = 0;
function get(type as string, name as string = null) as ArtisanRecipeBuilder {
    var recipeName = name;
    if (isNull(recipeName)) {
        recipeName = "recipe" ~ noNameId;
        noNameId += 1;
    }
    return ArtisanRecipeBuilder(type, recipeName);
}
