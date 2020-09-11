#priority 295
#loader contenttweaker

import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;

val sys0 as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(0);
sys0.registerMaterial("Titanium", 0xDED3F8);
sys0.registerMaterial("Soldering", 0x2F4517);
sys0.registerMaterial("CopperRefined", 0xF04208);
sys0.registerMaterial("ElvenCopper", 0xCC6699);
sys0.registerMaterial("EnergeticTin", 0x1BE8FF);
sys0.registerMaterial("Chromium", 0xE83A37);
sys0.registerMaterial("Indium", 0x99CCFF);
sys0.registerMaterial("Nichrome", 0xE7DCC3);
sys0.registerNormalPart("dustSmall", "item", false);
sys0.registerNormalPart("casing", "block", false);
sys0.addPart("ingot");
sys0.addPart("dust");
sys0.addPart("gear");
sys0.addPart("plate");
sys0.addPart("rod");
sys0.addPart("block");
sys0.addPart("nugget");
// sys0.addPart("armor");
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
sys1.registerMaterial("Steel", 0x858585);
sys1.registerMaterial("Ferramic", 0xAF9089);
sys1.addPart("casing");
sys1.addPart("dustSmall");
sys1.addPart("plate");
sys1.addPart("rod");
sys1.registerAllMaterialParts();

val sys2 as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(2);
sys2.addMaterial("Osmium");
sys2.addPart("gear");
sys2.registerAllMaterialParts();

val sys3 as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(3);
sys3.registerMaterial("Marble", 0xe7e7e7);
sys3.addPart("dust");
sys3.registerAllMaterialParts();

val sys4 as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(4);
sys4.addMaterial("Gold");
sys4.addMaterial("Silver");
sys4.addMaterial("Nichrome");
sys4.registerNormalPart("wire", "item", false);
sys4.registerNormalPart("wirecoil", "item", true);
// sys4.registerNormalPart("blockWirecoil", "block", true);
sys4.registerAllMaterialParts();
