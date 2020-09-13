#priority 70
import mods.modularmachinery.RecipeBuilder;

val machineName as string = "catalytic_cracker";

RecipeBuilder.newBuilder(machineName ~ "diesel", machineName, 10)
.addEnergyPerTickInput(240)
.addFluidInput(<fluid:diesel>)
.addGasOutput(<gas:ethene>.NAME, 6)
.build();

RecipeBuilder.newBuilder(machineName ~ "lubricant", machineName, 10)
.addEnergyPerTickInput(240)
.addFluidInput(<fluid:lubricant>)
.addGasOutput(<gas:ethene>.NAME, 8)
.build();

RecipeBuilder.newBuilder(machineName ~ "gasoline", machineName, 10)
.addEnergyPerTickInput(240)
.addFluidInput(<fluid:gasoline>)
.addGasOutput(<gas:ethene>.NAME, 4)
.build();
