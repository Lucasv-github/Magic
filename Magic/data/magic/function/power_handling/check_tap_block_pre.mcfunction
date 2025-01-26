tag @s remove tap_blocked

tag @s[tag=external_tap_blocked] add tap_blocked

tag @s add check_tap_block_temp

execute at @s as @e[type=minecraft:armor_stand,tag=tap_blocker] run function magic:power_handling/check_tap_block

tag @s remove check_tap_block_temp