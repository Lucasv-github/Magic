scoreboard players operation Temp reg_1 = @s player_id

tag @s add display_shelds_tell_temp

execute at @s as @e[tag=weave_shield,tag=target_point,tag=actively_held,sort=nearest] if score @s weave_locked_player_id = Temp reg_1 run tag @s add display_shelds_send_temp
execute at @s as @e[tag=weave_shield,tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},sort=nearest] if score @s weave_locked_player_id = Temp reg_1 run tag @s add display_shelds_send_temp

execute as @e[tag=display_shelds_send_temp] run function magic:display_shields_iteration

tag @e remove display_shelds_send_temp
tag @s remove display_shelds_tell_temp