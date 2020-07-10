import crafttweaker.player.IPlayer;
import scripts.compatSkills.Utils.levelUp;
import scripts.compatSkills.EnumSkill.MACHINERY;

function run(player as IPlayer) as int {
    if (isNull(player.currentItem)) return 1;
    if (player.currentItem.definition.id == "minecraft:iron_ingot") {
        levelUp(player, MACHINERY, 1, 2);
    }
    // TODO 升级提示
    return 0;
}