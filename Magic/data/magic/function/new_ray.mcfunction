execute at @s run playsound minecraft:entity.item.pickup player @s

#This is needed for all the functions that use t_1 instead of both. E.g. bridge, throw or fire ray
execute store result score @s t_1 run data get entity @s SelectedItem.components.minecraft:custom_data.T_1
execute store result score @s t_2 run data get entity @s SelectedItem.components.minecraft:custom_data.T_2
execute store result score @s t_3 run data get entity @s SelectedItem.components.minecraft:custom_data.T_3
execute store result score @s t_4 run data get entity @s SelectedItem.components.minecraft:custom_data.T_4
execute store result score @s t_5 run data get entity @s SelectedItem.components.minecraft:custom_data.T_5
execute store result score @s t_6 run data get entity @s SelectedItem.components.minecraft:custom_data.T_6
execute store result score @s t_7 run data get entity @s SelectedItem.components.minecraft:custom_data.T_7
execute store result score @s t_8 run data get entity @s SelectedItem.components.minecraft:custom_data.T_8
execute store result score @s t_9 run data get entity @s SelectedItem.components.minecraft:custom_data.T_9
execute store result score @s t_10 run data get entity @s SelectedItem.components.minecraft:custom_data.T_10
execute store result score @s t_11 run data get entity @s SelectedItem.components.minecraft:custom_data.T_11
execute store result score @s t_12 run data get entity @s SelectedItem.components.minecraft:custom_data.T_12
execute store result score @s t_13 run data get entity @s SelectedItem.components.minecraft:custom_data.T_13
execute store result score @s t_14 run data get entity @s SelectedItem.components.minecraft:custom_data.T_14
execute store result score @s t_15 run data get entity @s SelectedItem.components.minecraft:custom_data.T_15
execute store result score @s t_16 run data get entity @s SelectedItem.components.minecraft:custom_data.T_16
execute store result score @s t_17 run data get entity @s SelectedItem.components.minecraft:custom_data.T_17
execute store result score @s t_18 run data get entity @s SelectedItem.components.minecraft:custom_data.T_18
execute store result score @s t_19 run data get entity @s SelectedItem.components.minecraft:custom_data.T_19
execute store result score @s t_20 run data get entity @s SelectedItem.components.minecraft:custom_data.T_20

scoreboard players operation Ray_data reg_1 = @s player_id

scoreboard players operation Ray_data reg_4 = @s current_held
scoreboard players operation Ray_data reg_4 /= 10 reg_1
scoreboard players set Ray_data reg_2 1
scoreboard players set Ray_data reg_3 0

#Bridge and throw will use the old snowball system
execute positioned ^ ^2 ^1 run function magic:ray_iteration