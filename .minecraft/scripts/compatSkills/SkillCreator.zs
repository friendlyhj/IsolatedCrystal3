#priority 500
import mods.compatskills.SkillCreator;
import mods.compatskills.Skill;

val machinery = SkillCreator.createSkill("machinery", "thermalfoundation:textures/blocks/storage/block_invar.png");
machinery.name = "机械学";
for i in 0 .. 5 {
    machinery.setRankIcon(i, "minecraft:textures/items/iron_ingot.png");
}
for i in 5 .. 9 {
    machinery.setRankIcon(i, "thermalfoundation:textures/items/util/multimeter.png");
}
machinery.setEnabled(true);
machinery.setLevelCap(12);
