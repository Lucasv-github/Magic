#say set weave from player

scoreboard players operation Temp reg_1 = @s player_id

execute as @a if score @s player_id = Temp reg_1 if score @s t_1 matches 1.. run tag @s add set_weave_from_my_score
execute as @a if score @s player_id = Temp reg_1 if data entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index run tag @s add set_weave_from_my_hand

#Can get a weave later but available right now
execute unless entity @a[tag=set_weave_from_my_score] unless entity @a[tag=set_weave_from_my_hand] run tag @s add no_weave

#Observe that both of these methods can be valid at once

#No need for if entity here
scoreboard players operation @s t_1 = @a[limit=1,tag=set_weave_from_my_score] t_1
scoreboard players operation @s t_2 = @a[limit=1,tag=set_weave_from_my_score] t_2
scoreboard players operation @s t_3 = @a[limit=1,tag=set_weave_from_my_score] t_3
scoreboard players operation @s t_4 = @a[limit=1,tag=set_weave_from_my_score] t_4
scoreboard players operation @s t_5 = @a[limit=1,tag=set_weave_from_my_score] t_5
scoreboard players operation @s t_6 = @a[limit=1,tag=set_weave_from_my_score] t_6
scoreboard players operation @s t_7 = @a[limit=1,tag=set_weave_from_my_score] t_7
scoreboard players operation @s t_8 = @a[limit=1,tag=set_weave_from_my_score] t_8
scoreboard players operation @s t_9 = @a[limit=1,tag=set_weave_from_my_score] t_9
scoreboard players operation @s t_10 = @a[limit=1,tag=set_weave_from_my_score] t_10
scoreboard players operation @s t_11 = @a[limit=1,tag=set_weave_from_my_score] t_11
scoreboard players operation @s t_12 = @a[limit=1,tag=set_weave_from_my_score] t_12
scoreboard players operation @s t_13 = @a[limit=1,tag=set_weave_from_my_score] t_13
scoreboard players operation @s t_14 = @a[limit=1,tag=set_weave_from_my_score] t_14
scoreboard players operation @s t_15 = @a[limit=1,tag=set_weave_from_my_score] t_15
scoreboard players operation @s t_16 = @a[limit=1,tag=set_weave_from_my_score] t_16
scoreboard players operation @s t_17 = @a[limit=1,tag=set_weave_from_my_score] t_17
scoreboard players operation @s t_18 = @a[limit=1,tag=set_weave_from_my_score] t_18
scoreboard players operation @s t_19 = @a[limit=1,tag=set_weave_from_my_score] t_19
scoreboard players operation @s t_20 = @a[limit=1,tag=set_weave_from_my_score] t_20
execute as @a[limit=1,tag=set_weave_from_my_score] run say from score


#If entity is needed here
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_1 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_1
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_2 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_2
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_3 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_3
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_4 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_4
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_5 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_5
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_6 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_6
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_7 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_7
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_8 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_8
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_9 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_9
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_10 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_10
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_11 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_11
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_12 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_12
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_13 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_13
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_14 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_14
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_15 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_15
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_16 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_16
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_17 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_17
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_18 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_18
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_19 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_19
execute if entity @a[limit=1,tag=set_weave_from_my_hand] store result score @s t_20 run data get entity @a[limit=1,tag=set_weave_from_my_hand] SelectedItem.components.minecraft:custom_data.T_20
execute as @a[limit=1,tag=set_weave_from_my_hand] run say from hand

execute as @s[tag=!no_weave] run function magic:pre_weaves

tag @a remove set_weave_from_my_score
tag @a remove set_weave_from_my_hand