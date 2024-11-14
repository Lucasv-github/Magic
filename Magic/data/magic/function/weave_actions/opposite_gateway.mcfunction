execute store result entity @s Pos[0] double 1 run scoreboard players get @s destination_x
execute store result entity @s Pos[1] double 1 run scoreboard players get @s destination_y
execute store result entity @s Pos[2] double 1 run scoreboard players get @s destination_z

execute at @s run forceload add ~ ~

execute at @s run setblock ~ ~ ~ minecraft:barrier
execute at @s run setblock ~ ~1 ~ minecraft:barrier
execute at @s run setblock ~ ~2 ~ minecraft:barrier
execute at @s run setblock ~3 ~ ~ minecraft:barrier
execute at @s run setblock ~3 ~1 ~ minecraft:barrier
execute at @s run setblock ~3 ~2 ~ minecraft:barrier

#Top
execute at @s run setblock ~1 ~3 ~ minecraft:barrier
execute at @s run setblock ~2 ~3 ~ minecraft:barrier

#Bottom
execute at @s run setblock ~ ~-1 ~ minecraft:barrier
execute at @s run setblock ~3 ~-1 ~ minecraft:barrier
execute at @s run setblock ~1 ~-1 ~ minecraft:barrier
execute at @s run setblock ~2 ~-1 ~ minecraft:barrier

#Portal
execute at @s run setblock ~1 ~2 ~ minecraft:nether_portal
execute at @s run setblock ~2 ~2 ~ minecraft:nether_portal
execute at @s run setblock ~1 ~1 ~ minecraft:nether_portal
execute at @s run setblock ~2 ~1 ~ minecraft:nether_portal
execute at @s run setblock ~1 ~0 ~ minecraft:nether_portal
execute at @s run setblock ~2 ~0 ~ minecraft:nether_portal

execute at @s run setblock ~1 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @e[distance=..1.7,tag=!target_point] run function magic:magic_actions/travel"}
execute at @s run setblock ~2 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @e[distance=..1.7,tag=!target_point] run function magic:magic_actions/travel"}

#Set position to return
scoreboard players operation @s destination_x = @s return_x
scoreboard players operation @s destination_y = @s return_y
scoreboard players operation @s destination_z = @s return_z

scoreboard players add @s destination_z 2

tag @s add gateway_end
tag @s remove gateway_end_temp

#To make work with sense + bypass some other stuff
tag @s add target_point