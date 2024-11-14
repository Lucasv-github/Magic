execute at @s as @e[type=item_frame,distance=..10,sort=nearest] if data entity @s Item.components.minecraft:custom_data.Angreal_base unless data entity @s Item.components.minecraft:custom_data.Angreal_top run tag @s add weave_sink_power_angreal_temp

execute if data entity @s Item.components.minecraft:custom_data.Angreal_base unless data entity @s Item.components.minecraft:custom_data.Angreal_top run tag @s add weave_sink_power_angreal_temp

#TODO branch out
execute if entity @e[tag=weave_sink_power_angreal_temp,limit=1] run scoreboard players operation Temp reg_1 = @s player_id
execute as @e[tag=weave_sink_power_angreal_temp,limit=1] run scoreboard players set Temp reg_2 0
execute as @e[tag=weave_sink_power_angreal_temp,limit=1] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s current_held
execute as @e[tag=weave_sink_power_angreal_temp,limit=1] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players set @s current_held 20
execute as @e[tag=weave_sink_power_angreal_temp,limit=1] run scoreboard players remove Temp reg_2 20

execute as @e[tag=weave_sink_power_angreal_temp,limit=1] store result score Temp reg_1 run data get entity @s Item.components.minecraft:custom_data.Power_sinked
execute as @e[tag=weave_sink_power_angreal_temp,limit=1] run scoreboard players operation Temp reg_2 /= 10 reg_1
execute as @e[tag=weave_sink_power_angreal_temp,limit=1] run scoreboard players operation Temp reg_1 += Temp reg_2
execute as @e[tag=weave_sink_power_angreal_temp,limit=1] at @s run tellraw @a[tag=can_see,distance=..10] {"score":{"name":"Temp","objective":"reg_1"},"color":"gold"}
execute as @e[tag=weave_sink_power_angreal_temp,limit=1] store result entity @s Item.components.minecraft:custom_data.Power_sinked int 1 run scoreboard players get Temp reg_1

tag @e remove weave_sink_power_angreal_temp