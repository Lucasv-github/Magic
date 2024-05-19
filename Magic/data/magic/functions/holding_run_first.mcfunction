say hrf

scoreboard players operation Temp reg_1 = @s player_id

execute as @s store result score Temp reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index


#Use previous if not holding book
execute if score Temp reg_2 matches 0 run scoreboard players operation Temp reg_2 = @s player_weave_index_current

execute as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add current_to_be_run

#Need to set again to keep 0 this time
execute as @s store result score @s reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index

#From slot 8
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_1 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_1
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_2 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_2
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_3 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_3
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_4 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_4
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_5 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_5
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_6 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_6
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_7 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_7
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_8 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_8
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_9 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_9
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_10 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_10
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_11 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_11
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_12 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_12
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_13 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_13
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_14 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_14
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_15 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_15
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_16 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_16
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_17 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_17
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_18 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_18
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_19 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_19
execute if score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_20 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.T_20

#From selected
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_1 run data get entity @s SelectedItem.components.minecraft:custom_data.T_1
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_2 run data get entity @s SelectedItem.components.minecraft:custom_data.T_2
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_3 run data get entity @s SelectedItem.components.minecraft:custom_data.T_3
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_4 run data get entity @s SelectedItem.components.minecraft:custom_data.T_4
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_5 run data get entity @s SelectedItem.components.minecraft:custom_data.T_5
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_6 run data get entity @s SelectedItem.components.minecraft:custom_data.T_6
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_7 run data get entity @s SelectedItem.components.minecraft:custom_data.T_7
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_8 run data get entity @s SelectedItem.components.minecraft:custom_data.T_8
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_9 run data get entity @s SelectedItem.components.minecraft:custom_data.T_9
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_10 run data get entity @s SelectedItem.components.minecraft:custom_data.T_10
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_11 run data get entity @s SelectedItem.components.minecraft:custom_data.T_11
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_12 run data get entity @s SelectedItem.components.minecraft:custom_data.T_12
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_13 run data get entity @s SelectedItem.components.minecraft:custom_data.T_13
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_14 run data get entity @s SelectedItem.components.minecraft:custom_data.T_14
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_15 run data get entity @s SelectedItem.components.minecraft:custom_data.T_15
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_16 run data get entity @s SelectedItem.components.minecraft:custom_data.T_16
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_17 run data get entity @s SelectedItem.components.minecraft:custom_data.T_17
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_18 run data get entity @s SelectedItem.components.minecraft:custom_data.T_18
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_19 run data get entity @s SelectedItem.components.minecraft:custom_data.T_19
execute unless score @s reg_2 matches 0 store result score @e[tag=current_to_be_run] t_20 run data get entity @s SelectedItem.components.minecraft:custom_data.T_20


tag @e[tag=current_to_be_run] add held_executed_once
execute as @e[tag=current_to_be_run] run function magic:holding_run_second
tag @e[tag=current_to_be_run] remove current_to_be_run

#Prevent weaves from executing in a loop
tag @s add more_blocked