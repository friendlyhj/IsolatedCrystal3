#loader contenttweaker
import mods.contenttweaker.tconstruct.MaterialBuilder;

val tin = MaterialBuilder.create("tin");
tin.color = 0xc9e6e3;
tin.castable = true;
tin.craftable = false;
tin.liquid = <liquid:tin>;
tin.addItem(<item:thermalfoundation:material:129>);
tin.representativeItem = <item:thermalfoundation:material:129>;
tin.addHeadMaterialStats(140, 4.2, 3.5, 1);
tin.addHandleMaterialStats(1.1, -50);
tin.addExtraMaterialStats(80);
tin.addMaterialTrait("sharp", null);
tin.register();

val compressedIron = MaterialBuilder.create("iron_compressed");
compressedIron.color = 0x34302d;
compressedIron.castable = true;
compressedIron.craftable = false;
compressedIron.liquid = <liquid:compressed_iron>;
compressedIron.addItem(<item:pneumaticcraft:ingot_iron_compressed>);
compressedIron.representativeItem = <item:pneumaticcraft:ingot_iron_compressed>;
compressedIron.addHeadMaterialStats(325, 5.5, 4.5, 2);
compressedIron.addHandleMaterialStats(0.8, 180);
compressedIron.addExtraMaterialStats(55);
compressedIron.addMaterialTrait("heavy", null);
compressedIron.register();
