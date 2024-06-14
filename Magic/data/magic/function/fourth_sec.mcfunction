execute as @a[tag=can_use,tag=using,scores={disguise=0}] run scoreboard players operation @s reg_1 = @s current_held
execute as @a[tag=can_use,tag=using,scores={disguise=0}] run scoreboard players operation @s reg_1 /= 10 reg_1
execute as @a[tag=can_use,tag=using,scores={disguise=0}] run function magic:display_player_glow

execute at @a[tag=can_use,tag=!using] run particle minecraft:glow ~ ~2 ~ 0 0 0 0 1 normal @a[tag=can_see]