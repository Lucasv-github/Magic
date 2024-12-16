scoreboard players operation Temp reg_1 = @s player_id

execute at @s as @e[type=item_frame,distance=..10,sort=nearest] if data entity @s Item.components.minecraft:custom_data.Angreal_base unless data entity @s Item.components.minecraft:custom_data.Angreal_top run tag @s add weave_sink_power_angreal_temp
execute as @e[tag=weave_sink_power_angreal_temp] if data entity @s Item.components.minecraft:custom_data.Angreal_base unless data entity @s Item.components.minecraft:custom_data.Angreal_top run function magic:magic_actions/sink_angreal
tag @s remove weave_sink_power_angreal_temp

scoreboard players set Temp reg_1 0
execute at @s as @e[type=item_frame,distance=..10,sort=nearest] run tag @s add weave_sink_power_well_temp
execute store result score Temp reg_3 run data get entity @e[tag=weave_sink_power_well_temp,limit=1] Item.components.minecraft:custom_data.Well_max
execute store result score Temp reg_2 run data get entity @e[tag=weave_sink_power_well_temp,limit=1] Item.components.minecraft:custom_data.Well_current

scoreboard players operation Temp reg_1 = @s player_id

execute if score Temp reg_3 matches 1.. if score Temp reg_3 > Temp reg_2 as @e[tag=weave_sink_power_well_temp,limit=1] run function magic:magic_actions/sink_well
tag @e remove weave_sink_power_well_temp

