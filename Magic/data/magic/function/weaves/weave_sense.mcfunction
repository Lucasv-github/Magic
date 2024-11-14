scoreboard players operation Temp reg_1 = @s player_id
execute as @a if score @s player_id = Temp reg_1 run tag @s add sensing

#TODO use the sensing tag?
execute at @s as @e[type=armor_stand, distance=..10,tag=target_point] at @s run function magic:display/display_composition

execute at @s as @e[type=armor_stand, distance=..10,tag=target_point,scores={destination_x=-2147483647..}] at @s run tellraw @a[distance=..10] ["",{"score":{"name":"@s","objective":"destination_x"},"color":"gold"},{"text":" | ","color":"gold"},{"score":{"name":"@s","objective":"destination_y"},"color":"gold"},{"text":" | ","color":"gold"},{"score":{"name":"@s","objective":"destination_z"},"color":"gold"}]

tag @a remove sensing