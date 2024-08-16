scoreboard players operation Temp reg_1 = @s weave_locked_player_id

#Did not lock/locked self, apply to other entities
execute as @s if score @s player_id = @s weave_locked_player_id at @s run effect give @e[limit=1, sort=nearest, distance=..5, type=!player,tag=!target_point,type=!snowball] minecraft:slowness 10 255
execute as @s if score @s weave_locked_player_id matches 0 at @s run effect give @e[limit=1, sort=nearest, distance=..5, type=!player,tag=!target_point,type=!snowball] minecraft:slowness 10 255

execute as @s unless score @s player_id = @s weave_locked_player_id at @s as @a if score @s player_id = Temp reg_1 run effect give @s minecraft:slowness 10 255