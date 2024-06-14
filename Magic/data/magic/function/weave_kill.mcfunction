scoreboard players operation Temp reg_1 = @s weave_execute_id

#Did not lock/locked self, apply to other entities
execute as @s if score @s player_id = @s weave_execute_id at @s run damage @e[limit=1, sort=nearest, distance=..5, type=!player,tag=!target_point,type=!snowball] 1 minecraft:magic
execute as @s if score @s weave_execute_id matches 0 at @s run damage @e[limit=1, sort=nearest, distance=..5, type=!player,tag=!target_point,type=!snowball] 1 minecraft:magic

execute as @s unless score @s player_id = @s weave_execute_id at @s as @a if score @s player_id = Temp reg_1 run damage @s 1 minecraft:magic