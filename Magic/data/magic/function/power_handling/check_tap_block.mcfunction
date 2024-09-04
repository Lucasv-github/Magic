tag @s remove tap_blocked

tag @s[tag=external_tap_blocked] add tap_blocked

execute at @s if entity @e[type=minecraft:armor_stand,tag=tap_blocker_10,distance=..10] run tag @s add tap_blocked
execute at @s if entity @e[type=minecraft:armor_stand,tag=tap_blocker_20,distance=..20] run tag @s add tap_blocked
execute at @s if entity @e[type=minecraft:armor_stand,tag=tap_blocker_50,distance=..50] run tag @s add tap_blocked
execute at @s if entity @e[type=minecraft:armor_stand,tag=tap_blocker_100,distance=..100] run tag @s add tap_blocked