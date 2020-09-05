#priority 200
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.manatweaks.ManaHandler;

val soldering as Item = VanillaFactory.createItem("soldering_manasteel");
soldering.maxStackSize = 1;
soldering.maxDamage = 127;
soldering.itemRightClick = function(stack, world, player, hand) {
    if (stack.damage != 0 && !world.remote && ManaHandler.requestManaExact(stack, player, 1000, true)) {
        stack.damage(2 - 3, player); // ZenScript Rubbish! Cannot resolve -1!
    }
    return "Fail";
};
soldering.register();