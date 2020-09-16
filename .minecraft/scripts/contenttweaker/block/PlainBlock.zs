#priority 200
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import scripts.grassUtils.CotUtils.addBlock;

val glass as Block = VanillaFactory.createBlock("optical_glass", <blockmaterial:glass>);
glass.blockSoundType= <soundtype:glass>;
glass.blockHardness = 2.0f;
glass.blockResistance = 20.0f;
glass.translucent = true;
glass.fullBlock = false;
glass.blockLayer = "TRANSLUCENT";
glass.lightValue = 7;
glass.register();

addBlock("infinite_rock", <blockmaterial:rock>, 50.0f, 8000.0f, <soundtype:stone>, 0, false, "pickaxe", 3);
addBlock("nichrome_wirecoil_block", <blockmaterial:iron>, 5.0f, 20.0f, <soundtype:metal>, 0, false, "pickaxe", 0);
addBlock("xu_frame", <blockmaterial:iron>, 3.0f, 50.0f, <soundtype:metal>, 0, false, "pickaxe", 0);
addBlock("crystal_sand", <blockmaterial:sand>, 1.0f, 20.0f, <soundtype:sand>, 0, true, "shovel", 0);
