#priority 30001
#loader contenttweaker
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;
import mods.contenttweaker.Part;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.RegisterMaterialPart;
import mods.contenttweaker.PartDataPiece;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.PartType;
import mods.contenttweaker.IItemColorSupplier;
import mods.contenttweaker.IBlockColorSupplier;
import scripts.grassUtils.StringHelperCot as StringHelper;
import scripts.grassUtils.LoggerCot as Logger;

zenClass MaterialSystemHelper {
    zenConstructor() {
    }
    var materialList as Material[string] = {};
    var partList as string[] = [];
    
    function registerMaterial(name as string, color as int) as Material {
        Logger.sendInfo("Registering material " ~ name);
        val id as string = StringHelper.toUpperCamelCase(name);
        var material as Material = MaterialSystem.getMaterialBuilder().setName(id).setColor(color).build();
        this.materialList[id] = material;
        return material;
    }

    function getMaterial(key as string) as Material {
        return MaterialSystem.getMaterial(key);
    }

    function getAllMaterials() as Material[string] {
        return MaterialSystem.getMaterials();
    }

    function addPart(partID as string) as string {
        this.partList += partID;
        return partID;
    }

    function registerNormalPart(name as string, type as string, hasOverlay as bool) as Part {
        Logger.sendInfo("Registering normal part " ~ name);
        val id as string = StringHelper.toSnakeCase(name);
        val oreDictID as string = StringHelper.toLowerCamelCase(name);
        val temp as PartBuilder = MaterialSystem.getPartBuilder().setName(id).setPartType(MaterialSystem.getPartType(type)).setOreDictName(oreDictID);
        var part as Part = hasOverlay ? temp.setHasOverlay(true).build() : temp.build();
        this.partList += part.getName();
        return part;
    }

    function registerSpecialPart(name as string, hasOverlay as bool, fx as RegisterMaterialPart) as Part {
        // TODO
        Logger.sendWarning("Registering special part is NOT supported.");
        return null;
    }

    function getPart(key as string) as Part {
        return MaterialSystem.getPart(key);
    }

    function getAllParts() as Part[string] {
        return MaterialSystem.getParts();
    }

    function registerMaterialPart(materialID as string, partID as string) /* as MaterialPart */{
        Logger.sendInfo("Registering material part: " ~ materialID ~ "_" ~ partID);
        /* return */ this.materialList[materialID].registerPart(partID);
    }

    function registerMaterialPartsByPart(partID as string) /* as MaterialPart[] */{
        Logger.sendInfo("Registering material parts: " ~ "any_" ~ partID);
        /* return */ this.getPart(partID).registerToMaterials(this.materialList.values);
    }

    function registerMaterialPartsByMaterial(materialID as string) /* as MaterialPart[] */{
        Logger.sendInfo("Registering material parts: " ~ materialID ~ "_any");
        /* return */ this.materialList[materialID].registerParts(this.partList);
    }

    function registerAllMaterialParts() {
        for key in materialList {
            this.registerMaterialPartsByMaterial(key);
        }
    }
}