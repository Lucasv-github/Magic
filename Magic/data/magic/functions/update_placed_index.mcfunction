execute store result score @s player_weave_index_current run data get entity @s Inventory[{Slot:8b}].tag.Player_weave_index
tag @s add built

#Change those without a weave
scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s player_weave_index_current
execute as @e[tag=target_point,tag=!held_executed_once] if score @s player_id = Temp reg_1 run scoreboard players operation @s player_weave_index = Temp reg_2


#Set player values correctly
execute store result score @s t_1 run data get entity @s Inventory[{Slot:8b}].tag.T_1
execute store result score @s t_2 run data get entity @s Inventory[{Slot:8b}].tag.T_2
execute store result score @s t_3 run data get entity @s Inventory[{Slot:8b}].tag.T_3
execute store result score @s t_4 run data get entity @s Inventory[{Slot:8b}].tag.T_4
execute store result score @s t_5 run data get entity @s Inventory[{Slot:8b}].tag.T_5
execute store result score @s t_6 run data get entity @s Inventory[{Slot:8b}].tag.T_6
execute store result score @s t_7 run data get entity @s Inventory[{Slot:8b}].tag.T_7
execute store result score @s t_8 run data get entity @s Inventory[{Slot:8b}].tag.T_8
execute store result score @s t_9 run data get entity @s Inventory[{Slot:8b}].tag.T_9
execute store result score @s t_10 run data get entity @s Inventory[{Slot:8b}].tag.T_10
execute store result score @s t_11 run data get entity @s Inventory[{Slot:8b}].tag.T_11
execute store result score @s t_12 run data get entity @s Inventory[{Slot:8b}].tag.T_12
execute store result score @s t_13 run data get entity @s Inventory[{Slot:8b}].tag.T_13
execute store result score @s t_14 run data get entity @s Inventory[{Slot:8b}].tag.T_14
execute store result score @s t_15 run data get entity @s Inventory[{Slot:8b}].tag.T_15
execute store result score @s t_16 run data get entity @s Inventory[{Slot:8b}].tag.T_16
execute store result score @s t_17 run data get entity @s Inventory[{Slot:8b}].tag.T_17
execute store result score @s t_18 run data get entity @s Inventory[{Slot:8b}].tag.T_18
execute store result score @s t_19 run data get entity @s Inventory[{Slot:8b}].tag.T_19
execute store result score @s t_20 run data get entity @s Inventory[{Slot:8b}].tag.T_20

