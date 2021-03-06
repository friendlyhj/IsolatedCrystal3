#priority 70
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.ResearchTable;
import scripts.compatSkills.EnumSkill.getSkillByAlias;

recipes.addShaped("research_table", <item:researchtable:table>, [
    [null, <item:minecraft:book>, null],
    [null, <ore:ingotIron>, null],
    [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]
]);

var cat = ResearchTable.addCategory(<item:appliedenergistics2:material:1>);

ResearchTable.builder("botany_6", cat)
    .setIcons(<item:botania:manaresource:8>)
    .setTitle("isc.research.botany.6")
    .setDescription("isc.research.bontany.6.description")
    .addCondition(<item:botania:manaresource:7> * 8, <item:botania:manaresource:8> * 8, <item:botania:manaresource:9> * 2)
    .setRequiredSkill(getSkillByAlias("b").key, 5)
    .setRewardSkill(getSkillByAlias("b").key, 6)
.build();

ResearchTable.builder("energistics_3", cat)
    .setIcons(<item:minecraft:redstone>)
    .setTitle("isc.research.energistics.3")
    .setDescription("isc.research.energistics.3.description")
    .addCondition(<item:minecraft:redstone> * 16)
    .setRequiredSkill(getSkillByAlias("n").key, 2)
    .setRewardSkill(getSkillByAlias("n").key, 3)
.build();

ResearchTable.builder("endery_3", cat)
    .setIcons(<ore:dustEnder>.firstItem)
    .setTitle("isc.research.endery.3")
    .setDescription("isc.research.endery.3.description")
    .addCondition(<ore:dustEnder> * 2, <ore:enderpearl> * 2)
    .setRequiredSkill(getSkillByAlias("e").key, 2)
    .setRewardSkill(getSkillByAlias("e").key, 3)
.build();

ResearchTable.builder("endery_4", cat)
    .setIcons(<ore:obsidian>.firstItem)
    .setTitle("isc.research.endery.4")
    .setDescription("isc.research.endery.4.description")
    .addCondition(<ore:obsidian> * 10)
    .setRequiredSkill(getSkillByAlias("e").key, 3)
    .setRewardSkill(getSkillByAlias("e").key, 4)
.build();