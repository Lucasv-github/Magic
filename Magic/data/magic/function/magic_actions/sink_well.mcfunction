#Temp reg_1 should point to owner

scoreboard players set Temp reg_2 0
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s current_held
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players set @s current_held 20
scoreboard players remove Temp reg_2 20
scoreboard players operation Temp reg_2 /= 10 reg_1

execute store result score Temp reg_1 run data get entity @s Item.components.minecraft:custom_data.Well_current
scoreboard players operation Temp reg_1 += Temp reg_2
execute if score Temp reg_1 matches 0.. at @s run tellraw @a[tag=can_see,distance=..10] {"score":{"name":"Temp","objective":"reg_1"},"color":"gold"}
execute if score Temp reg_1 matches 0.. store result entity @s Item.components.minecraft:custom_data.Well_current int 1 run scoreboard players get Temp reg_1