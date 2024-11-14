scoreboard players operation Temp reg_1 = @s player_id

execute at @s as @e[tag=weave_shield,tag=target_point,tag=actively_held,sort=nearest] if score @s weave_locked_player_id = Temp reg_1 run tag @s add display_shelds_change_temp
execute at @s as @e[tag=weave_shield,tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},sort=nearest] if score @s weave_locked_player_id = Temp reg_1 run tag @s add display_shelds_change_temp

tag @e[type=minecraft:armor_stand,tag=display_shelds_change_temp,tag=shield_counter_selected] add shield_counter_selected_old
execute unless entity @e[type=minecraft:armor_stand,tag=display_shelds_change_temp,tag=shield_counter_selected] run tag @e remove shield_counter_selected_old

tag @e[type=minecraft:armor_stand,tag=display_shelds_change_temp,tag=!shield_counter_selected_old,limit=1,sort=nearest] add shield_counter_selected

tag @e[tag=display_shelds_change_temp,tag=shield_counter_selected_old] remove shield_counter_selected

tag @e remove display_shelds_change_temp

function magic:display/display_shields