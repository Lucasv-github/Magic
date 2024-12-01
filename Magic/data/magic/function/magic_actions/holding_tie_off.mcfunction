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
scoreboard players operation @s current_held -= Temp reg_3
scoreboard players operation Temp reg_3 *= 2 reg_1

#Need current held check as it is possible for the player to drop power

execute if score @s current_held matches 1.. as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add tied_off
execute if score @s current_held matches 1.. as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run scoreboard players operation @s weave_remaining_time = Temp reg_3

#Need to be last
execute if score @s current_held matches 1.. as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s remove actively_held

#Clear all items
item replace entity @s weapon.mainhand with minecraft:air