say PVE EXIT

#We want to spill out the weaves to clean them up
scoreboard players operation Temp reg_1 = @s entity_id
execute as @e[type=minecraft:chest_minecart,tag=magic_pve_inventory] if score @s magic_pve_owner_entity_id = Temp reg_1 run kill @s

#Add storage back to hold the weaves
execute at @s run summon minecraft:chest_minecart ~ ~ ~ {Tags:["magic_pve_inventory"],Invulnerable:1b}
execute at @s run ride @n[type=minecraft:chest_minecart,tag=magic_pve_inventory] mount @s

execute at @s run scoreboard players operation @n[type=minecraft:chest_minecart,tag=magic_pve_inventory] magic_pve_owner_entity_id = Temp reg_1