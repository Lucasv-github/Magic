################################################################################
#Purpose: Sink power into a well placed in an item frame from the player specified by player id Temp reg_1
#Arguments: Temp reg_1: power to sink
#Runner: An itemframe holding a well, run via magic_actions/sink_power.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################
execute store result score Temp reg_2 run data get entity @s Item.components.minecraft:custom_data.Well_current
scoreboard players operation Temp reg_2 += Temp reg_1
execute if score Temp reg_2 matches 0.. at @s run tellraw @a[tag=can_see,distance=..10] {"score":{"name":"Temp","objective":"reg_2"},"color":"gold"}
execute if score Temp reg_2 matches 0.. store result entity @s Item.components.minecraft:custom_data.Well_current int 1 run scoreboard players get Temp reg_2