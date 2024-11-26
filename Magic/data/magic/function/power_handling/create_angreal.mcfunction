#To be run as the item frame either in beginning or end

#Base
execute if data entity @s Item unless data entity @s Item.components.minecraft:custom_data.Angreal_base run tag @s add create_angreal_base_temp
execute as @s[tag=create_angreal_base_temp] run playsound minecraft:block.anvil.place ambient @a[distance=..10,tag=can_see]
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
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.enchantment_glint_override set value 1b
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Amplification:0}
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.minecraft:attribute_modifiers set value {show_in_tooltip:false,modifiers:[{type:"player.block_interaction_range", amount:-4.5, operation:"add_value", id:"magic:use_block"}]}
execute as @s[tag=create_angreal_top_temp] store result entity @s Item.components.minecraft:custom_data.Amplification int 1 run scoreboard players get Temp reg_1

tag @s remove create_angreal_top_temp
