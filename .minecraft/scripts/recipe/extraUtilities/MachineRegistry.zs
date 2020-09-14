#loader preinit
#priority 250
import extrautilities2.Tweaker.IMachine;
import extrautilities2.Tweaker.IMachineRegistry;
import extrautilities2.Tweaker.IMachineSlot;

IMachineRegistry.createNewMachine(
    "chlorinizer",
    40000,
    2000,
    [
        IMachineSlot.newFluidSlot("cl", 10000),
        IMachineSlot.newItemStackSlot("item"),
        IMachineSlot.newItemStackSlot("carbon")
    ],
    [
        IMachineSlot.newFluidSlot("output", 10000)
    ],
    "isolatedcrystal:blocks/chlorinizer",
    "isolatedcrystal:blocks/chlorinizer_working"
);

IMachineRegistry.createNewMachine(
    "electrolytic_ore_dresser",
    40000,
    2000,
    [
        IMachineSlot.newItemStackSlot("item"),
    ],
    [
        IMachineSlot.newItemStackSlot("dust"),
        IMachineSlot.newItemStackSlot("output")
    ],
    "isolatedcrystal:blocks/ore_dresser",
    "isolatedcrystal:blocks/ore_dresser_working"
);

IMachineRegistry.createNewMachine(
    "polymerizer",
    40000,
    2000,
    [
        IMachineSlot.newFluidSlot("fluid", 3000),
    ],
    [
        IMachineSlot.newItemStackSlot("output")
    ],
    "isolatedcrystal:blocks/polymerizer",
    "isolatedcrystal:blocks/polymerizer_working"
);
