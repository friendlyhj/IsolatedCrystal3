#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import scripts.libs.Vector3D;

static aff as IItemStack = <contenttweaker:afflatus_of_crafting>;
static affc as IItemStack = <contenttweaker:completed_afflatus_of_crafting>;
static requiredNum as int = 9;
recipes.addShaped(aff * 7, [
    [null, <minecraft:cobblestone>, null],
    [<minecraft:cobblestone>, <minecraft:crafting_table>, <minecraft:cobblestone>],
    [null, <minecraft:cobblestone>, null]
]);
recipes.addShapeless(<botania:manaresource:21> * 4, [<ore:cobblestone>]);
recipes.addShaped(<minecraft:cobblestone>, [
    [<botania:manaresource:21>, <botania:manaresource:21>],
    [<botania:manaresource:21>, <botania:manaresource:21>]
]);
recipes.remove(<minecraft:crafting_table>);
recipes.addShapeless(<minecraft:crafting_table>, [<ore:logWood>, affc]);
recipes.addShapeless(<minecraft:crafting_table> * 3, [<ore:logWood>, <ore:logWood>, <ore:logWood>, <contenttweaker:cyan_fruit>]);
static craftingAfflatusInfo as function(IItemStack)int[] = function(item as IItemStack)as int[]{
    //return [numberOfCompletedCrafts, leastUncompletedCrafts]
    var T as int[] = [0,0] as int[];
    if(!aff.matches(item)) return T;
    var data = item.tag;
    if(isNull(data)) return T;
    if(data.deepGetBool("completed")) return [36,-1 as int] as int[];
    if(!(data has "affCounting0")) return T;
    var count = 0;
    var a = data.deepGetInt("affCounting0");//.asInt();
    var b = data.deepGetInt("affCounting1");//data.affCounting1.asInt();
    var t = 1;
    var minMissing = 114;
    for i in 0 to 24 {
        if((a&t)>0) count+=1;
        else if(minMissing>i) minMissing = i;
        if((b&t)>0) count+=1;
        else if(minMissing>i+24) minMissing = i+24;
        t*=2;
    }
    return [count,minMissing] as int[];
};
recipes.addShapeless("afflatus_of_crafting_process", affc*7, [aff,aff,aff,aff,aff,aff,aff],
    function(out, ins, cinfo){
        var nullsT = [] as int[];
        if(cinfo.inventory.width!=3) return null;
        if(cinfo.inventory.height!=3) return null;
        var f = false;
        var lastNBT as IData = null;
        for i in 0 to 9{
            var t = cinfo.inventory.items[i/3][i%3];
            if(isNull(t))nullsT+=i;
            else{
                if(f){
                    if(lastNBT!=t.tag) return null;
                }
                else{
                    lastNBT = t.tag;
                    f = true;
                }
            }
        }
        if(nullsT.length!=2) return null;
        var i = nullsT[0];
        var j = nullsT[1];
        var index as int = i*(17-i)/2 + j - i - 1; //The index for current recipe
        if(isNull(lastNBT)) lastNBT = IData.createEmptyMutableDataMap(); 
        print(isNull(lastNBT));
        //print(lastNBT has "affCounting0");
        //print(lastNBT.affCrafting0.asInt());
        var a = (lastNBT has "affCounting0") ? lastNBT.affCounting0.asInt() : 0;
        var b = (lastNBT has "affCounting1") ? lastNBT.affCounting1.asInt() : 0;
        if(index<24) a=a|Vector3D.pow2(index);
        else b=b|Vector3D.pow2(index - 24);
        var out2 = aff.withTag(lastNBT + {"affCounting0":a, "affCounting1":b} as IData);
        var affInfo = craftingAfflatusInfo(out2);
        if(affInfo[0]>=requiredNum) return affc*7;//M.shimmer(aff).withTag({"completed":true})*7;
        return out2*7;
    }, null
);
static affFindI as int[] = [
    0,0,0,0,0,0,0,0,
    1,1,1,1,1,1,1,
    2,2,2,2,2,2,
    3,3,3,3,3,
    4,4,4,4,
    5,5,5,
    6,6,
    7
] as int[];
aff.modifyTooltip(function(item, tooltip, shiftPressed, advanced) {
    if (item.tag.deepGetBool("completed")){
        tooltip.add(game.localize("modpack.tooltip.afflatus_of_crafting.completed"));
    } else if (shiftPressed) {
        var lastNBT as IData = isNull(item.tag)?IData.createEmptyMutableDataMap():item.tag;
        var strShift = game.localize("modpack.tooltip.afflatus_of_crafting.shifted");
        var a = (lastNBT has "affCounting0") ? lastNBT.affCounting0.asInt() : 0;
        var b = (lastNBT has "affCounting1") ? lastNBT.affCounting1.asInt() : 0;
        var ans = "";
        var t = 1;
        for i in 0 to 24{
            if((a&t)==0) ans = ans~i~" ";
            t = t*2;
        }
        t = 1;
        for i in 0 to 12{
            if((b&t)==0) ans = ans~(i+24)~" ";
            t = t*2;
        }
        tooltip.add(strShift);
        tooltip.add(ans);
    } else {
        var info = craftingAfflatusInfo(item);
        var strShift = game.localize("modpack.tooltip.afflatus_of_crafting.shift");
        //var str1 = game.localize("modpack.tooltip.afflatus_of_crafting.requirement",[info[0],requiredNum]);
        //var str1 = crafttweaker.text.ITextComponent.fromTranslation("modpack.tooltip.afflatus_of_crafting.requirement",[info[0],requiredNum]) as string;
        var str1 = mods.zenutils.I18n.format("modpack.tooltip.afflatus_of_crafting.requirement",[info[0],requiredNum]);
        var str2 = game.localize("modpack.tooltip.afflatus_of_crafting.next");
        var t = info[1];
        var i = affFindI[t];
        var j = t+i+1 - i*(17-i)/2;
        tooltip.add(strShift);
        tooltip.add(str1);
        tooltip.add(str2);
        var matrixRow = "";
        for k in 0 to 9{
            matrixRow ~= ((k==i || k==j) ? "O" : "X");
            if (k % 3 == 2) {
                tooltip.add(matrixRow ~ ";");
                matrixRow = "";
            }
        }
    }
});

recipes.addShapeless(<botania:grassseeds>, [<contenttweaker:jade_leaf>]);
val blackBrick = <ore:ingotBrickSeared>;
recipes.remove(<tcomplement:melter:8>);
recipes.addShaped(<tcomplement:melter:8>, [
    [null, blackBrick, null],
    [blackBrick, blackBrick, blackBrick],
    [blackBrick, <contenttweaker:blazing_spark>, blackBrick]
]);
recipes.remove(<tcomplement:melter>);
recipes.addShaped(<tcomplement:melter>, [
    [affc, blackBrick, affc],
    [<contenttweaker:crushed_crushed>, blackBrick, <contenttweaker:crushed_crushed>],
    [blackBrick, blackBrick, blackBrick]
]);
recipes.remove(<minecraft:furnace>);
recipes.remove(<botania:altar>);
recipes.addShaped(<botania:altar>, [
    [<minecraft:stone_slab:3>, affc, <minecraft:stone_slab:3>],
    [null, <ore:cobblestone>, null],
    [<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>]
]);
recipes.addShaped(<artisanworktables:worktable:11>, [
    [<ore:woolWhite>, <ore:plankWood>, <ore:woolWhite>],
    [affc, <ore:logWood>, affc],
    [<minecraft:fence>, <minecraft:fence>, <minecraft:fence>]
]);

recipes.remove(<botania:spreader>);
recipes.addShaped(<botania:spreader>, [
    [<ore:livingwood>, <ore:livingwood>, <ore:livingwood>],
    [<ore:blockGlass>, <botania:petal:*>, null],
    [<ore:livingwood>, <ore:livingwood>, <ore:livingwood>]
]);
recipes.remove(<botania:blazeblock>);
recipes.addShaped(<botania:blazeblock>, [
    [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>],
    [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>],
    [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]
]);
recipes.removeByRecipeName("botania:conversions/blazeblock_deconstruct");
recipes.addShapeless(<minecraft:blaze_powder> * 9, [<botania:blazeblock>]);
recipes.remove(<naturesaura:gold_fiber>);
recipes.remove(<naturesaura:gold_powder>);
recipes.remove(<botania:felpumpkin>);
recipes.addShaped(<contenttweaker:destruction_matrix>, [
    [<contenttweaker:crushed_crushed>, <contenttweaker:crushed_crushed>, <contenttweaker:crushed_crushed>],
    [<contenttweaker:crushed_crushed>, null, <contenttweaker:crushed_crushed>],
    [<contenttweaker:crushed_crushed>, <contenttweaker:crushed_crushed>, <contenttweaker:crushed_crushed>]
]);
recipes.remove(<botania:cocoon>);
recipes.addShaped(<botania:cocoon>, [
    [<minecraft:string>, <minecraft:string>, <minecraft:string>],
    [<botania:manaresource:22>, <botania:felpumpkin>, <botania:manaresource:22>],
    [<minecraft:string>, <naturesaura:infused_iron>, <minecraft:string>]
]);
recipes.remove(<tconstruct:smeltery_controller>);
recipes.addShaped(<tconstruct:smeltery_controller>, [
    [<tconstruct:seared:3>, <contenttweaker:flesh_crystal>, <tconstruct:seared:3>],
    [<contenttweaker:destruction_crystal>, <tcomplement:melter>, <contenttweaker:destruction_crystal>],
    [<tconstruct:seared:3>, <contenttweaker:crafting_crystal>, <tconstruct:seared:3>]
]);
recipes.addShaped(<contenttweaker:mana_crusher>, [
    [<botania:rune:2>, <botania:rune:8>, <botania:rune:2>],
    [<ore:livingrock>, <ore:livingrock>, <ore:livingrock>],
    [<ore:livingrock>, <ore:blockLead>, <ore:livingrock>]
]);
recipes.remove(<botania:lens:13>);
recipes.addShapeless(<botania:lens:13>, [<botania:lens>, <botania:rune>, <contenttweaker:ocean_crystal>]);

// furnace.remove(<projectred-core:resource_item:103>);
// recipes.remove(<naturesaura:offering_table>);




