#priority 300
#loader contenttweaker

import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;

val sys as MaterialSystemHelper = CotUtils.getMaterialSystemHelper();
sys.addPart("ingot");
sys.addPart("dust");
sys.addPart("gear");
sys.addPart("plate");
sys.addPart("rod");
sys.addPart("block");
// sys.addPart("armor");
sys.registerMaterial("Titanium", 0xDED3F8);
sys.registerMaterial("Soldering", 0x2F4517);
sys.registerAllMaterialParts();