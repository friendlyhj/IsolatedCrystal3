#priority 500
import mods.compatskills.SkillCreator;
import mods.compatskills.Skill;

val machinery = SkillCreator.createSkill("machinery", "thermalfoundation:textures/blocks/storage/block_invar.png");
machinery.name = game.localize("isc.skill.machinery");
for i in 0 .. 5 {
    machinery.setRankIcon(i, "minecraft:textures/items/iron_ingot.png");
}
for i in 5 .. 9 {
    machinery.setRankIcon(i, "thermalfoundation:textures/items/util/multimeter.png");
}
machinery.setEnabled(true);
machinery.setLevelCap(12);

val botany = SkillCreator.createSkill("botany", "botania:textures/blocks/livingwood0.png");
botany.name = game.localize("isc.skill.botany");
for i in 0 .. 9 {
    botany.setRankIcon(i, "botania:textures/items/seed_world.png");
}
botany.setEnabled(true);
botany.setLevelCap(12);

val endery = SkillCreator.createSkill("endery", "actuallyadditions:textures/blocks/block_misc_enderpearl.png");
endery.name = game.localize("isc.skill.endery");
for i in 0 .. 9 {
    endery.setRankIcon(i, "minecraft:textures/items/ender_eye");
}
endery.setEnabled(true);
endery.setLevelCap(12);

val metallurgy = SkillCreator.createSkill("metallurgy", "thermalfoundation:textures/blocks/storage/block_steel.png");
metallurgy.name = game.localize("isc.skill.metallurgy");
for i in 0 .. 9 {
    metallurgy.setRankIcon(i, "thermalfoundation:textures/items/material/ingot_invar.png");
}
metallurgy.setEnabled(true);
metallurgy.setLevelCap(12);

val astronomy = SkillCreator.createSkill("astronomy", "astralsorcery:textures/blocks/marble_chiseled.png");
astronomy.name = game.localize("isc.skill.astronomy");
for i in 0 .. 9 {
    astronomy.setRankIcon(i, "astralsorcery:textures/items/crystal_rock.png");
}
astronomy.setEnabled(true);
astronomy.setLevelCap(12);

val energistics = SKillCreator.createSkill("energistics", "immersiveengineering:textures/blocks/metal_decoration0_generator.png");
energistics.name = game.localize("isc.skill.energistics");
for i in 0 .. 9 {
    energistics.setRankIcon(i, "thermalexpansion:textures/items/capacitor/capacitor_1.png");
}
energistics.setEnabled(true);
energistics.setLevelCap(12);

val informatics = SkillCreator.createSkill("informatics", "appliedenergistics2:textures/blocks/energy_cell3.png");
informatics.name = game.localize("isc.skill.informatics");
for i in 0 .. 9 {
    informatics.setRankIcon(i, "appliedenergistics2:textures/items/material_logic_processor.png");
}
informatics.setEnabled(true);
informatics.setLevelCap(12);