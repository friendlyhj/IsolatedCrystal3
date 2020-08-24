#priority 295
#loader contenttweaker

import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;

val sys0 as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(0);
sys0.addPart("ingot");
sys0.addPart("dust");
sys0.addPart("gear");
sys0.addPart("plate");
sys0.addPart("rod");
sys0.addPart("block");
sys0.addPart("nugget");
// sys0.addPart("armor");
sys0.registerMaterial("Titanium", 0xDED3F8);
sys0.registerMaterial("Soldering", 0x2F4517);
sys0.registerAllMaterialParts();

val sys1 as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(1);
sys1.addMaterial("Iron");
sys1.addMaterial("Gold");
sys1.addMaterial("Copper");
sys1.addMaterial("Tin");
sys1.addMaterial("Aluminium");
sys1.addMaterial("Lead");
sys1.addMaterial("Silver");
sys1.addMaterial("Nickel");
sys1.addMaterial("Osmium");
sys1.addMaterial("Platinum");
sys1.addMaterial("Iridium");
sys1.registerMaterial("Ferramic", 0xFFEEEB);
sys1.addPart("plate");
sys1.addPart("rod");
sys1.registerAllMaterialParts();

val sys2 as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(2);
sys2.addMaterial("Osmium");
sys2.addPart("gear");
sys2.registerAllMaterialParts();
