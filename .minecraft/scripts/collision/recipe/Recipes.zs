#loader crafttweaker

import crafttweaker.item.IItemStack;
import crafttweaker.item.IItemDefinition;

val p as IItemStack = <item:contenttweaker:proton>;
val n as IItemStack = <item:contenttweaker:neutron>;

n.definition.setContainerItem(<item:contenttweaker:neutron_empty>.definition);
p.definition.setContainerItem(<item:contenttweaker:proton_empty>.definition);

recipes.addShaped("refined_proton", <contenttweaker:proton_refined>, [
    [null,p,null],
    [p,<contenttweaker:proton_empty_refined>,p],
    [null,p,null]
]);

recipes.addShaped("refined_neutron", <contenttweaker:neutron_refined>, [
    [null,n,null],
    [n,<contenttweaker:neutron_empty_refined>,n],
    [null,n,null]
]);