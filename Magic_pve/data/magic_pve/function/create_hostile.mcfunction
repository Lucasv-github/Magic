function magic:magic_support/add_ability

#Hasn't been run yet and needed for chest minecart
execute store result score @s entity_id run random value 1..2147483646

execute store result score @s magic_pve_my_tick run random value 0..20

#To open with some power
scoreboard players set @s sneak_time 0

#To hold the weaves
execute at @s run summon minecraft:chest_minecart ~ ~ ~ {Tags:["magic_pve_inventory"],Invulnerable:1b}
execute at @s run ride @n[type=minecraft:chest_minecart,tag=magic_pve_inventory] mount @s

#Death detection
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["magic_pve_death_detect"],Invulnerable:1b}
execute at @s run ride @n[type=minecraft:armor_stand,tag=magic_pve_death_detect] mount @s

scoreboard players operation Temp reg_1 = @s entity_id
execute at @s run scoreboard players operation @n[type=minecraft:chest_minecart,tag=magic_pve_inventory] magic_pve_owner_entity_id = Temp reg_1
execute at @s run scoreboard players operation @n[type=minecraft:armor_stand,tag=magic_pve_death_detect] magic_pve_owner_entity_id = Temp reg_1