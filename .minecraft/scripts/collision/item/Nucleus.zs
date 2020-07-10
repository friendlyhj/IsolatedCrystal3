// by: youyihj
#priority 298
#loader contenttweaker

import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;
import mods.contenttweaker.Material;

static sys as MaterialSystemHelper = CotUtils.getMaterialSystemHelper();
for key, value in scripts.collision.data.OreArray.oreList {
    sys.registerMaterial(key, value[0]);
}

sys.registerNormalPart("nucleus", "item", false);

sys.registerAllMaterialParts();

static materialList as Material[string] = sys.materialList;