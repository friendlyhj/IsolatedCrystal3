#reloadable
#priority 2147483645
import mods.artisanworktables.builder.RecipeBuilder;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.data.IData;
import mods.modularmachinery.IMachineController;
import mods.ctintegration.date.IDate;
import mods.ctintegration.util.DateUtil;
import scripts.libs.Vector3D;

static basicAspects as string[] = [
    "aer",
    "terra",
    'ignis',
    "aqua",
    "ordo",
    "perditio"
];

static lunarCode as int[] = [
    0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950, 0x16554, 0x056a0, 0x09ad0, 0x055d2,//1900-1909
    0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250, 0x1d255, 0x0b540, 0x0d6a0, 0x0ada2, 0x095b0, 0x14977,//1910-1919
    0x04970, 0x0a4b0, 0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570, 0x052f2, 0x04970,//1920-1929
    0x06566, 0x0d4a0, 0x0ea50, 0x16a95, 0x05ad0, 0x02b60, 0x186e3, 0x092e0, 0x1c8d7, 0x0c950,//1930-1939
    0x0d4a0, 0x1d8a6, 0x0b550, 0x056a0, 0x1a5b4, 0x025d0, 0x092d0, 0x0d2b2, 0x0a950, 0x0b557,//1940-1949
    0x06ca0, 0x0b550, 0x15355, 0x04da0, 0x0a5b0, 0x14573, 0x052b0, 0x0a9a8, 0x0e950, 0x06aa0,//1950-1959
    0x0aea6, 0x0ab50, 0x04b60, 0x0aae4, 0x0a570, 0x05260, 0x0f263, 0x0d950, 0x05b57, 0x056a0,//1960-1969
    0x096d0, 0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540, 0x0b6a0, 0x195a6,//1970-1979
    0x095b0, 0x049b0, 0x0a974, 0x0a4b0, 0x0b27a, 0x06a50, 0x06d40, 0x0af46, 0x0ab60, 0x09570,//1980-1989
    0x04af5, 0x04970, 0x064b0, 0x074a3, 0x0ea50, 0x06b58, 0x05ac0, 0x0ab60, 0x096d5, 0x092e0,//1990-1999
    0x0c960, 0x0d954, 0x0d4a0, 0x0da50, 0x07552, 0x056a0, 0x0abb7, 0x025d0, 0x092d0, 0x0cab5,//2000-2009
    0x0a950, 0x0b4a0, 0x0baa4, 0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176, 0x052b0, 0x0a930,//2010-2019
    0x07954, 0x06aa0, 0x0ad50, 0x05b52, 0x04b60, 0x0a6e6, 0x0a4e0, 0x0d260, 0x0ea65, 0x0d530,//2020-2029
    0x05aa0, 0x076a3, 0x096d0, 0x04afb, 0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250, 0x0d520, 0x0dd45,//2030-2039
    0x0b5a0, 0x056d0, 0x055b2, 0x049b0, 0x0a577, 0x0a4b0, 0x0aa50, 0x1b255, 0x06d20, 0x0ada0,//2040-2049
    0x14b63, 0x09370, 0x049f8, 0x04970, 0x064b0, 0x168a6, 0x0ea50, 0x06b20, 0x1a6c4, 0x0aae0,//2050-2059
    0x092e0, 0x0d2e3, 0x0c960, 0x0d557, 0x0d4a0, 0x0da50, 0x05d55, 0x056a0, 0x0a6d0, 0x055d4,//2060-2069
    0x052d0, 0x0a9b8, 0x0a950, 0x0b4a0, 0x0b6a6, 0x0ad50, 0x055a0, 0x0aba4, 0x0a5b0, 0x052b0,//2070-2079
    0x0b273, 0x06930, 0x07337, 0x06aa0, 0x0ad50, 0x14b55, 0x04b60, 0x0a570, 0x054e4, 0x0d160,//2080-2089
    0x0e968, 0x0d520, 0x0daa0, 0x16aa6, 0x056d0, 0x04ae0, 0x0a9d4, 0x0a2d0, 0x0d150, 0x0f252,//2090-2099
];

function getArtisanRecipeBuilder(type as string) as RecipeBuilder {
    return RecipeBuilder.get(type);
}

function now() as IDate {
    return IDate.getInstance();
}

function chineseLunar(date as IDate) as IData {
    // 1900/1/31
    val baseDate = IDate.getInstance();
    baseDate.year = 1900;
    baseDate.month = DateUtil.JANUARY();
    baseDate.day = 31;

    var offset = ((date.timeInMillis - baseDate.timeInMillis) / 86400000L) as int;
    
    var year = 1900;
    var daysOfYear = 0;
    for iYear in 1900 .. 2100 {
        daysOfYear = getLunarYearDays(iYear);
        if (offset < daysOfYear) {
            year = iYear;
            break;
        }
        offset -= daysOfYear;
    }
    val leapMonth = getLunarLeapMonth(year);
    var month = 1;
    var daysOfMonth = 0;
    var hasLeapMonth = false;
    for iMonth in 1 .. 13 {
        if (leapMonth > 0 && iMonth == leapMonth + 1) {
            daysOfMonth = getLunarLeapDays(year);
            hasLeapMonth = true;
        } else {
            daysOfMonth = getLunarMonthDays(year, hasLeapMonth ? iMonth - 1 : iMonth);
        }

        if (offset < daysOfMonth) {
            month = iMonth;
            break;
        }
        offset -= daysOfMonth;
    }
    val isLeapMonth = leapMonth > 0 && month == leapMonth + 1;
    if (hasLeapMonth && !isLeapMonth) {
        month -= 1;
    }
    return {
        "year": year,
        "month": month,
        "day": offset + 1,
        "leapMonth": isLeapMonth
    };
}

function getLunarYearDays(year as int) as int {
    var sum = 348;
    val info = getLunarCode(year);
    var i = 0x8000;
    while (i > 0x8) {
        sum += (info & i) != 0 ? 1 : 0;
        i /= 2;
    }
    return sum + getLunarLeapDays(year);
}

function getLunarLeapDays(year as int) as int {
    if (getLunarLeapMonth(year) != 0) {
        return (getLunarCode(year) & 0x10000) != 0 ? 30 : 29;
    } else {
        return 0;
    }
}

function getLunarMonthDays(year as int, month as int) as int {
    return (getLunarCode(year) & shr(0x10000, month)) != 0 ? 30 : 29;
}

function getLunarLeapMonth(year as int) as int {
    return (getLunarCode(year) & 0x0f);
}

function getLunarCode(year as int) as int {
    return lunarCode[year - 1900];
}

$expand IBlockPos$rotateYNorthUntil(facing as IFacing) as IBlockPos {
    var current as IFacing = north;
    var rot = this;
    while (current != facing) {
        current = current.rotateY();
        rot = IBlockPos.create(-rot.getZ(), rot.getY(), rot.getX());
    }
    return rot;
}

$expand IBlockPos$offset(pos as IBlockPos) as IBlockPos {
    return this.add(pos.x, pos.y, pos.z);
}

$expand IMachineController$relativePos(x as int, y as int, z as int) as IBlockPos {
    return this.pos.offset(this.rotateWithControllerFacing(IBlockPos.create(x, y, z)));
}

function toLowerCamelCase(arg as string) as string {
    if (arg.contains("_")) { //snake case
        var splitResult as string[] = arg.split("_");
        var temp as string = "";
        for i, j in splitResult {
            if (i == 0) {
                temp ~= j;
            } else if (i >= 1) {
                temp ~= (j[0].toUpperCase() ~ j.substring(1)); 
            }
        }
        return temp;
    } else if (arg[0].toLowerCase() != arg[0]) { //upper camel case
        return arg[0].toLowerCase() ~ arg.substring(1);
    } else return arg; //lower camel case or invalid case
}

function toUpperCamelCase(arg as string) as string {
    if (arg.contains("_")) { //snake case
        var splitResult as string[] = arg.split("_");
        var temp as string = "";
        for i, j in splitResult {
            temp ~= (j[0].toUpperCase() ~ j.substring(1));
        }
        return temp;
    } else if (arg[0].toUpperCase() != arg[0]) { //lower camel case
        return arg[0].toUpperCase() ~ arg.substring(1);
    } else return arg; //upper camel case or invalid case
}

function toSnakeCase(arg as string) as string {
    if (arg.contains("_")) { //snake case
        return arg;
    } else { //camel case
        var temp as string = arg[0];
        for i in 1 .. arg.length {
            if (arg[i].toLowerCase() != arg[i]) {
                temp ~= "_";
            }
            temp ~= arg[i];
        }
        return temp.toLowerCase();
    }
}

function shr(value as int, shift as int) as int {
    return value / Vector3D.pow2(shift);
}
