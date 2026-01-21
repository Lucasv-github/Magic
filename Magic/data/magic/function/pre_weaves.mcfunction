################################################################################
#Purpose: First thing to be run when a weave should fire, including after just landing
#Runner: The armorstand that holds the weave
#Return values:
#Authors: Lprogrammer
################################################################################

execute store result storage magic:get_weave_length index int 1 run scoreboard players get @s player_weave_index
function magic:weave_processing/get_weave_length with storage magic:get_weave_length

data remove storage magic:get_weave_length index

scoreboard players operation Temp reg_3 = Temp reg_1

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id

#No longer removing force here

#Then update current draw
#Set co current in case none found
scoreboard players operation Temp reg_2 = @s current_draw
execute as @e[tag=using, tag=can_use] if score @s entity_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s current_draw
scoreboard players operation @s current_draw = Temp reg_2

#Set despawn time to that multiplied by component count only if longer than last
scoreboard players operation @s reg_1 = @s current_draw
scoreboard players operation @s reg_1 *= Temp reg_3

scoreboard players add @s weave_despawn_time 0

execute if score @s reg_1 > @s weave_despawn_time run scoreboard players operation @s weave_despawn_time = @s reg_1

#If current_draw is 0 the player has dropped (current draw gets reset to zero because no player will be found to se that from if the player drops)

#Preload to make first firing fast
scoreboard players set @s[tag=!weave_run_yet] weave_second_counter 3

#Only check inverted here the first time
execute as @s[tag=!weave_run_yet] run function magic:weave_processing/check_inverted

#Then display
function magic:magic_support/calculate_distance

#Remove truly_see from all but self if inverted
scoreboard players operation Temp reg_1 = @s weave_owner_player_id
execute as @s[tag=inverted] as @a[tag=truly_see] unless score @s player_id = Temp reg_1 run tag @s remove truly_see

scoreboard players set Temp reg_1 1
function magic:display/print_weave_composition

#Fire weaves exept first time this function runs
execute as @s[tag=weave_run_yet] run function magic:weaves

tag @s add weave_run_yet