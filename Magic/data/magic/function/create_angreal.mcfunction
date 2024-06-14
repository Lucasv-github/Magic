tag @e[distance=..10,type=item_frame,sort=nearest,limit=1] add create_angreal_current

#Base
execute unless data entity @e[tag=create_angreal_current,limit=1] Item.components.minecraft:custom_data.Angreal_base unless data entity @e[tag=create_angreal_current,limit=1] Item.components.minecraft:custom_data.Angreal_top run playsound minecraft:block.anvil.place ambient @a[distance=..10]
execute unless data entity @e[tag=create_angreal_current,limit=1] Item.components.minecraft:custom_data.Angreal_base unless data entity @e[tag=create_angreal_current,limit=1] Item.components.minecraft:custom_data.Angreal_top run data modify entity @e[tag=create_angreal_current,limit=1] Item.tag merge value {Power_sinked:0}
execute unless data entity @e[tag=create_angreal_current,limit=1] Item.components.minecraft:custom_data.Angreal_base unless data entity @e[tag=create_angreal_current,limit=1] Item.components.minecraft:custom_data.Angreal_top run data modify entity @e[tag=create_angreal_current,limit=1] Item.tag merge value {Angreal_base:1}

#Top
execute store result score Temp reg_1 run data get entity @e[tag=create_angreal_current,limit=1] Item.components.minecraft:custom_data.Power_sinked
scoreboard players operation Temp reg_1 /= 10000 reg_1
execute if score Temp reg_1 matches 1.. run playsound minecraft:block.anvil.place ambient @a[distance=..10]
execute if score Temp reg_1 matches 1.. run data modify entity @e[tag=create_angreal_current,limit=1] Item.tag merge value {Angreal_top:1}
execute if score Temp reg_1 matches 1.. run data modify entity @e[tag=create_angreal_current,limit=1] Item.tag merge value {Enchantments:[{}]}
execute if score Temp reg_1 matches 1.. run data modify entity @e[tag=create_angreal_current,limit=1] Item.tag merge value {Amplification:0}
execute store result entity @e[tag=create_angreal_current,limit=1] Item.components.minecraft:custom_data.Amplification int 1 run scoreboard players get Temp reg_1
tag @e[tag=create_angreal_current] remove create_angreal_current