scoreboard players operation Temp reg_1 = @s player_id
execute store result score Temp reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
execute as @e[tag=target_point,tag=actively_held] if score @s player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add new_ray_multi_blocked_temp

execute unless entity @e[tag=new_ray_multi_blocked_temp] run function magic:new_ray

tag @e remove new_ray_multi_blocked_temp
scoreboard players set @s click 0