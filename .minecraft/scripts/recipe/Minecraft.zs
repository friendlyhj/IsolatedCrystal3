#priority 10

for i in 0 .. 16 {
    furnace.setFuel(<item:minecraft:carpet>.definition.makeStack(i), 0);
}
