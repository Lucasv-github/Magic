execute at @s run summon zombie ~ ~ ~ {PersistenceRequired:0b,HandItems:[{id:golden_sword,components:{enchantments:{levels:{fire_aspect:2,knockback:2,mending:1,sharpness:5,unbreaking:3}}},count:1}],ArmorItems:[{id:golden_boots,components:{enchantments:{levels:{mending:1,protection:4,unbreaking:3}}},count:1},{id:golden_leggings,components:{enchantments:{levels:{mending:1,protection:4,unbreaking:3}}},count:1},{id:golden_chestplate,components:{enchantments:{levels:{mending:1,protection:4,unbreaking:3}}},count:1},{id:golden_helmet,components:{enchantments:{levels:{mending:1,protection:4,unbreaking:3}}},count:1}],HandDropChances:[0f],ArmorDropChances:[0f,0f,0f,0f],Tags:["pve_spawned","magic_pve_zombie_gold"]}

execute at @s as @e[type=minecraft:zombie,limit=1,sort=nearest,tag=pve_spawned] run function magic_pve:create_hostile