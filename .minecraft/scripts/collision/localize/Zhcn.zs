#priority 10
#loader preinit

static lang as string[string] = {
    "tile.contenttweaker.proton.name" : "质子吸收载体",
    "tile.contenttweaker.proton_empty.name" : "质子吸收载体（空）",
    "tile.contenttweaker.neutron.name" : "中子吸收载体",
    "tile.contenttweaker.neutron_empty.name" : "中子吸收载体（空）",
    "tile.contenttweaker.proton_refined.name" : "强化质子吸收载体",
    "tile.contenttweaker.proton_empty_refined.name" : "强化质子吸收载体（空）",
    "tile.contenttweaker.neutron_refined.name" : "强化中子吸收载体",
    "tile.contenttweaker.neutron_empty_refined.name" : "强化中子吸收载体（空）",
    "tile.contenttweaker.wither_altar.name" : "凋灵祭坛",
    "tile.contenttweaker.collider_lv1.name" : "1级粒子碰撞器",
    "tile.contenttweaker.collider_lv2.name" : "2级粒子碰撞器",
    "tile.contenttweaker.collider_lv3.name" : "3级粒子碰撞器",
    "tile.contenttweaker.collider_lv4.name" : "4级粒子碰撞器",
    "item.contenttweaker.collider_starter.name" : "粒子碰撞器启动器",
    "contenttweaker.part.nucleus" : "%s晶核",
    "contenttweaker.part.booster" : "%s金属增幅器",
    "item.contenttweaker.debugger.name" : "调试器",
    "item.contenttweaker.lava_drop.name" : "熔岩点滴",
    "item.contenttweaker.water_drop.name" : "水点滴",
    "item.contenttweaker.wither_altar_wand.name" : "凋灵献祭杖",
    "item.contenttweaker.little_ghast_drop.name" : "小滴恶魂之泪",
    "tile.contenttweaker.plank_wood.name" : "骨化木板",
    "tile.contenttweaker.metal_spawner.name" : "金属生成器",
    "tile.contenttweaker.gem_spawner.name" : "宝石生成器",
    "item.contenttweaker.metal_chunk.name" : "金属碎块",
    "item.contenttweaker.mystical_gem.name" : "神秘宝石"
};

for key, value in lang {
    game.setLocalization("zh_cn", key, value);
}
