#priority 300
#loader contenttweaker

import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;

val sys as MaterialSystemHelper = CotUtils.getMaterialSystemHelper();
sys.addPart("ingot");
sys.registerMaterial("Titanium", 0x2E2132);
sys.registerAllMaterialParts();