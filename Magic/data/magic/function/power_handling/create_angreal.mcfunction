################################################################################
#Purpose: Either create the base or finish the creation of a pumped angreal
#Runner: The itemframe holding the angreal
#Return values:
#Authors: Lprogrammer
################################################################################

#Base
execute if data entity @s Item unless data entity @s Item.components.minecraft:custom_data.Angreal_base run tag @s add create_angreal_base_temp
execute at @s[tag=create_angreal_base_temp] run playsound minecraft:block.anvil.place ambient @a[distance=..10,tag=can_see]
execute as @s[tag=create_angreal_base_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Power_sinked:0}
execute as @s[tag=create_angreal_base_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Angreal_base:1}

tag @s remove create_angreal_base_temp


#Top
scoreboard players set @s reg_1 0
execute if data entity @s Item unless data entity @s Item.components.minecraft:custom_data.Angreal_top store result score @s reg_1 run data get entity @s Item.components.minecraft:custom_data.Power_sinked

#@s not touched by math
scoreboard players operation @s reg_2 = @s reg_1

scoreboard players operation Temp reg_1 = @s reg_1
function magic:math/cube_root

scoreboard players operation Temp reg_1 /= 26 reg_1

execute if score Temp reg_1 matches 1.. run tag @s add create_angreal_top_temp

scoreboard players operation @s reg_1 = @s reg_2
scoreboard players operation @s reg_1 %= 100 reg_1

#execute if score @s reg_1 = Temp reg_1 run say not flawed
#execute unless score @s reg_1 = Temp reg_1 run say flawed

execute if score @s reg_1 = Temp reg_1 run data modify entity @s[tag=create_angreal_top_temp] Item.components.minecraft:custom_data merge value {Angreal_flawed:0}
execute unless score @s reg_1 = Temp reg_1 run data modify entity @s[tag=create_angreal_top_temp] Item.components.minecraft:custom_data merge value {Angreal_flawed:1}

execute as @s[tag=create_angreal_top_temp] run playsound minecraft:block.anvil.place ambient @a[distance=..10,tag=can_see]
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Angreal_top:1}
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.minecraft:enchantment_glint_override set value 1b
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Amplification:0}
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components merge value {attribute_modifiers:[{type:block_interaction_range,amount:-1,operation:add_multiplied_base,id:"1744537967229"}],tooltip_display:{hidden_components:[attribute_modifiers]}}
execute as @s[tag=create_angreal_top_temp] store result entity @s Item.components.minecraft:custom_data.Amplification int 1 run scoreboard players get Temp reg_1

tag @s remove create_angreal_top_temp
