################################################################################
#Purpose: Sink power into various appropriate items in an itemframe near a weave
#Runner: An armorstand holding an actively held sink power weave, run via events/second.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s current_sink

execute at @s as @e[type=item_frame,distance=..10] if data entity @s Item.components.minecraft:custom_data.Angreal_base unless data entity @s Item.components.minecraft:custom_data.Angreal_top run tag @s add sink_power_temp
execute at @s as @e[type=item_frame,distance=..10] if data entity @s Item.components.minecraft:custom_data.Well_max run tag @s add sink_power_temp

execute at @s as @e[limit=1,sort=nearest,tag=sink_power_temp] run tag @s add sink_power_nearest_temp

tag @e remove sink_power_temp

execute as @e[tag=sink_power_nearest_temp] if data entity @s Item.components.minecraft:custom_data.Angreal_base run function magic:magic_actions/sink_angreal
execute as @e[tag=sink_power_nearest_temp] if data entity @s Item.components.minecraft:custom_data.Angreal_max run function magic:magic_actions/sink_well

tag @e remove sink_power_nearest_temp

