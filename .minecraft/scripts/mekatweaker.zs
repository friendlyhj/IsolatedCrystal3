#priority 1000
import mods.mekatweaker.GasFactory;

// val gas = GasRegistry.register(Gas(<liquid:vinyl_chloride>.definition));
// print("weeee" ~ gas.name);

// for gas in GasRegistry.registeredGasses {
//     print(gas.name);
// }

print("registering gas");
GasFactory.createFromFluid(<liquid:vinyl_chloride>).register();
GasFactory.createFromFluid(<liquid:lpg>).register();
