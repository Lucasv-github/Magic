#say shield handling

#Getting shielded in Temp reg_1
#Shield lower amount Temp in reg_2

#Get shielder strength in Temp reg_4
scoreboard players set Temp reg_4 0
execute as @e[tag=target_point,tag=actively_held] if score @s weave_locked_player_id = Temp reg_1 run scoreboard players operation Temp reg_4 += @s cumulative_halve_amount_hold
execute as @e[tag=target_point,tag=tied_off, scores={weave_remaining_time=1..}] if score @s weave_locked_player_id = Temp reg_1 run scoreboard players operation Temp reg_4 += @s cumulative_halve_amount_hold

#Multiply shielder strength by 10
scoreboard players operation Temp reg_4 *= 10 reg_1

#Divide by person getting shielded
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_4 /= @s cumulative_halve_amount_hold

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_5 = @s cumulative_halve_amount_hold

execute if score Temp reg_2 matches 1.. run scoreboard players operation Temp reg_5 -= Temp reg_2
scoreboard players operation Temp reg_5 = Temp reg_2

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 unless score Temp reg_5 = @s cumulative_halve_amount_hold run tag @s add shield_handling_reduce_temp

execute as @a[tag=shield_handling_reduce_temp,limit=1] run scoreboard players operation @s reg_1 = @s current_held
execute as @a[tag=shield_handling_reduce_temp,limit=1] if score @s current_held > Temp reg_5 run scoreboard players operation @s current_held -= Temp reg_4

#Low cutout at 1:9
execute as @a[tag=shield_handling_reduce_temp,limit=1] run scoreboard players operation @s reg_2 = @s cumulative_halve_amount_hold
execute as @a[tag=shield_handling_reduce_temp,limit=1] run scoreboard players operation @s reg_2 /= 9 reg_1
execute as @a[tag=shield_handling_reduce_temp,limit=1] if score @s current_held < @s reg_2 run tag @s add tap_power_temp_shielded

execute as @a[tag=tap_power_temp_shielded] run function magic:power_handling/exit
execute as @a[tag=tap_power_temp_shielded] run function magic:tell_shielders

tag @a remove tap_power_temp_shielded
tag @a remove shield_handling_reduce_temp