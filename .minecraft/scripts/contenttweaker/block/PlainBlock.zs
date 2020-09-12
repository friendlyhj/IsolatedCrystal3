#priority 200
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val glass as Block = VanillaFactory.createBlock("optical_glass", <blockmaterial:glass>);
glass.blockSoundType= <soundtype:glass>;
glass.blockHardness = 2.0f;
glass.blockResistance = 20.0f;
glass.translucent = true;
glass.blockLayer = "TRANSLUCENT";
glass.lightValue = 7;
glass.register();
