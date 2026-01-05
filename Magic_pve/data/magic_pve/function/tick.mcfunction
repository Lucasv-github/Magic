execute as @e[tag=magic_pve_zombie_netherite] if score @s magic_pve_my_tick = Temp tick_counter run function magic_pve:think/think_netherite_zombie

execute as @e[tag=magic_pve_zombie_leather] if score @s magic_pve_my_tick = Temp tick_counter run function magic_pve:think/think_leather_zombie


#Disable to disable autospawning
execute as @e[type=zombie,tag=!magic_pve_processed_entity] run function magic_pve:spawner