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