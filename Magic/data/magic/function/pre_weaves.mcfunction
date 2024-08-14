execute store result storage magic:get_weave_length index int 1 run scoreboard players get @s player_weave_index
function magic:get_weave_length with storage magic:get_weave_length
scoreboard players operation Temp reg_3 = Temp reg_1

scoreboard players operation Temp reg_1 = @s player_id
scoreboard players set Remove_force reg_1 0

scoreboard players operation Remove_force reg_1 = Temp reg_3

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
scoreboard players operation @s reg_1 = @s weave_despawn_time
scoreboard players operation @s reg_1 *= Temp reg_3

scoreboard players operation @s weave_despawn_time = @s reg_1

tag @s add current_weave

#If current_held is 0 player has dropped (current held gets reset to zero because no player will be found to se t that from if the player drops)
execute as @s[tag=!ward_connected] if score @s current_held matches 1.. run function magic:weaves

tag @s remove current_weave