execute if score Temp tick_counter matches 0 as @e[tag=magic_pve_hostile] run function magic_pve:think
execute if score Temp tick_counter matches 10 as @e[tag=magic_pve_hostile] run function magic_pve:think

execute as @e[type=minecraft:zombie,tag=!magic_pve_processed_entity] store result score @s reg_1 run random value 0..10
execute as @e[type=minecraft:zombie,scores={reg_1=10},tag=!magic_pve_processed_entity] run function magic_pve:spawn_zombie
tag @e[type=minecraft:zombie] add magic_pve_processed_entity