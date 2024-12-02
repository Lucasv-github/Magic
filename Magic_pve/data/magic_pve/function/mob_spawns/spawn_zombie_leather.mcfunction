execute at @s run summon zombie ~ ~ ~ {PersistenceRequired:0b,HandItems:[{id:stone_sword,count:1}],ArmorItems:[{id:leather_boots,count:1},{id:leather_leggings,count:1},{id:leather_chestplate,count:1},{id:leather_helmet,count:1}],HandDropChances:[0f],ArmorDropChances:[0f,0f,0f,0f],Tags:["pve_spawned"]}

execute at @s as @e[type=minecraft:zombie,limit=1,sort=nearest,tag=pve_spawned] run function magic_pve:create_hostile
execute at @s run tag @e[type=minecraft:zombie,limit=1,sort=nearest,tag=pve_spawned] add magic_pve_zombie_leather