#priority 200
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Commands;
import mods.zenutils.StaticString;

val master as Item = VanillaFactory.createItem("mana_master");
master.maxStackSize = 1;
master.itemRightClick = function(stack, world, player, hand) {
    if (world.remote) return "Success";
    if (player.skillData.getSkillInfo(<skill:compatskills:botany>).level != 4) return "Fail";
    Commands.call(StaticString.format("/reskillable setskilllevel %s compatskills.botany 5", [player.name]), player, world, false, true);
    stack.shrink(1);
    return "Success";
};
master.register();
