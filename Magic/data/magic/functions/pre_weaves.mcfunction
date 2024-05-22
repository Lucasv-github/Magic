#say pre weaves

scoreboard players operation Temp reg_1 = @s player_id
scoreboard players set Remove_force reg_1 0

execute if score @s t_1 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_2 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_3 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_4 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_5 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_6 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_7 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_8 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_9 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_10 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_11 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_12 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_13 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_14 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_15 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_16 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_17 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_18 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_19 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1
execute if score @s t_20 matches 1.. as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players add Remove_force reg_1 1

#First time full, then /10
execute as @s[tag=!weave_run_yet] run scoreboard players operation Remove_force reg_1 *= 10 reg_1

tag @s add weave_run_yet

execute as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run function magic:remove_force_amount

#Then update current held
#Reset in case non found (in case of exit)
scoreboard players set Temp reg_2 0
execute as @a[tag=using, tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s current_held
scoreboard players operation @s current_held = Temp reg_2


#Set time remaining to held force times 10
scoreboard players operation @s weave_despawn_time = @s current_held

#Set despawn time to that multiplied by component count
execute if score @s t_1 matches 1.. run scoreboard players operation @s reg_1 = @s weave_despawn_time
execute if score @s t_2 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_3 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_4 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_5 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_6 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_7 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_8 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_9 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_10 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_11 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_12 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_13 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_14 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_15 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_16 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_17 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_18 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_19 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time
execute if score @s t_20 matches 1.. run scoreboard players operation @s reg_1 += @s weave_despawn_time

scoreboard players operation @s weave_despawn_time = @s reg_1

tag @s add current_weave

#If current_held is 0 player has dropped (current held gets reset to zero because no player will be found to se t that from if the player drops)
execute as @s[tag=!ward_connected] if score @s current_held matches 1.. run function magic:weaves

tag @s remove current_weave