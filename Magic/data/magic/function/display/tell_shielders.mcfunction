scoreboard players operation Temp reg_1 = @s player_id

execute as @e[tag=target_point,tag=actively_held] if score @s weave_locked_player_id = Temp reg_1 run tag @s add tell_shielders_temp
execute as @e[tag=target_point,tag=tied_off, scores={weave_remaining_time=1..}] if score @s weave_locked_player_id = Temp reg_1 run tag @s add tell_shielders_temp

execute as @e[tag=tell_shielders_temp] run function magic:tell_shielder_owner

tag @e remove tell_shielders_temp