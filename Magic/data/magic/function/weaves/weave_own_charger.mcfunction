scoreboard players operation Temp reg_1 = @s player_id

execute as @e[tag=target_point,scores={weave_remaining_time=1..},distance=..10,tag=tied_off] if score @s player_id = Temp reg_1 run scoreboard players add @s weave_remaining_time 5
execute as @e[tag=target_point,scores={weave_remaining_time=1..},distance=..10,tag=tied_off] if score @s player_id = Temp reg_1 run scoreboard players add @s weave_despawn_time 5