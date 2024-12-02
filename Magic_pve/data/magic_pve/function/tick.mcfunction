execute if score Temp tick_counter matches 0 as @e[tag=magic_pve_zombie_netherite] run function magic_pve:think/think_netherite_zombie
execute if score Temp tick_counter matches 10 as @e[tag=magic_pve_zombie_netherite] run function magic_pve:think/think_netherite_zombie

execute if score Temp tick_counter matches 0 as @e[tag=magic_pve_zombie_leather] run function magic_pve:think/think_leather_zombie
execute if score Temp tick_counter matches 10 as @e[tag=magic_pve_zombie_leather] run function magic_pve:think/think_leather_zombie


execute as @e[type=zombie,tag=!magic_pve_processed_entity] run function magic_pve:spawner