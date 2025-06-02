summon zombie ~ ~ ~ {PersistenceRequired:0b,equipment:{mainhand:{id:iron_sword},head:{id:chainmail_helmet},chest:{id:chainmail_chestplate},legs:{id:chainmail_leggings},feet:{id:chainmail_boots}},Tags:["pve_spawned","magic_pve_zombie_chainmail"]}

execute as @e[type=minecraft:zombie,limit=1,sort=nearest,tag=pve_spawned] run function magic_pve:create_hostile