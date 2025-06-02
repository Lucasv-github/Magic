summon zombie ~ ~ ~ {PersistenceRequired:0b,equipment:{mainhand:{id:stone_sword},head:{id:leather_helmet},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},Tags:["pve_spawned","magic_pve_zombie_iron"]}

execute as @e[type=minecraft:zombie,limit=1,sort=nearest,tag=pve_spawned] run function magic_pve:create_hostile
tag @e[type=minecraft:zombie,limit=1,sort=nearest,tag=pve_spawned] add magic_pve_zombie_leather