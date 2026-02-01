################################################################################
#Purpose: Tie off a player selected weave if placed, so that it continues running without depending on a channeling player
#Runner: A player who tied off a weave, via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#say holding tie off

execute at @s run playsound minecraft:block.lever.click player @s


#Need to setup for holding_run_first
function magic:inventory/swap_hands


#Sets things right
function magic:holding_run

#Need to make them tied off
scoreboard players operation Temp reg_1 = @s player_id
execute as @s store result score Temp reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
scoreboard players operation Temp reg_3 = @s tie_strength

#Consume 1 power for each 20 seconds
scoreboard players operation Temp reg_3 *= 10 reg_1

scoreboard players operation Temp reg_4 = @s current_draw
scoreboard players operation Temp reg_4 -= @s current_drain

scoreboard players operation Temp reg_5 = Temp reg_3
scoreboard players operation Temp reg_5 *= 2 reg_1

execute if score Temp reg_3 < Temp reg_4 as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add tied_off
execute if score Temp reg_3 < Temp reg_4 as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run scoreboard players operation @s weave_remaining_time = Temp reg_5

#Need to be last
execute if score Temp reg_3 < Temp reg_4 as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s remove actively_held

#Prevent illegal weave from triggering
scoreboard players operation Temp reg_1 = Temp reg_2
execute store result storage magic:weave_copies_remove_index i int 1 run scoreboard players get 0 reg_1
execute store result storage magic:weave_copies_remove_index player_id int 1 run scoreboard players get @s player_id
function magic:weave_handling/weave_copies_remove_index with storage magic:weave_copies_remove_index

data remove storage magic:weave_copies_remove_index i
data remove storage magic:weave_copies_remove_index player_id

scoreboard players remove @s weave_count 1

#Remove from current_drain
execute store result storage magic:get_weave_length index int 1 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
function magic:weave_processing/get_weave_length with storage magic:get_weave_length

data remove storage magic:get_weave_length index

scoreboard players operation Temp reg_1 *= 10 reg_1
scoreboard players operation @s current_drain -= Temp reg_1

#Clear all items
item replace entity @s weapon.mainhand with minecraft:air