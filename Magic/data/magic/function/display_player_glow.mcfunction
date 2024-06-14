execute at @s run particle minecraft:glow ~ ~2 ~ 0 0 0 0 1 normal @a[tag=can_see]
scoreboard players remove @s reg_1 10
execute if score @s reg_1 matches 1.. run function magic:display_player_glow