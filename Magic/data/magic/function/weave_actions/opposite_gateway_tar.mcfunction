################################################################################
#Purpose: Create an exit gateways for a tar travel weave and link it to the entry gateway
#Runner: An armorstand already placed at the position of the exit gateway, run via weave_actions/create_gateway_tar.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute store result entity @s Pos[0] double 1 run scoreboard players get @s destination_x
execute store result entity @s Pos[1] double 1 run scoreboard players get @s destination_y
execute store result entity @s Pos[2] double 1 run scoreboard players get @s destination_z

execute as @s[tag=in_tar] positioned as @s in magic_commons:tar run forceload add ~ ~
execute as @s[tag=!in_tar] positioned as @s in minecraft:overworld run forceload add ~ ~

execute positioned as @s run setblock ~ ~ ~ minecraft:barrier
execute positioned as @s run setblock ~ ~1 ~ minecraft:barrier
execute positioned as @s run setblock ~ ~2 ~ minecraft:barrier
execute positioned as @s run setblock ~3 ~ ~ minecraft:barrier
execute positioned as @s run setblock ~3 ~1 ~ minecraft:barrier
execute positioned as @s run setblock ~3 ~2 ~ minecraft:barrier

#Top
execute positioned as @s run setblock ~1 ~3 ~ minecraft:barrier
execute positioned as @s run setblock ~2 ~3 ~ minecraft:barrier

#Bottom
execute positioned as @s run setblock ~ ~-1 ~ minecraft:barrier
execute positioned as @s run setblock ~3 ~-1 ~ minecraft:barrier
execute positioned as @s run setblock ~1 ~-1 ~ minecraft:barrier
execute positioned as @s run setblock ~2 ~-1 ~ minecraft:barrier

#Portal
execute positioned as @s run setblock ~1 ~2 ~ minecraft:nether_portal
execute positioned as @s run setblock ~2 ~2 ~ minecraft:nether_portal
execute positioned as @s run setblock ~1 ~1 ~ minecraft:nether_portal
execute positioned as @s run setblock ~2 ~1 ~ minecraft:nether_portal
execute positioned as @s run setblock ~1 ~0 ~ minecraft:nether_portal
execute positioned as @s run setblock ~2 ~0 ~ minecraft:nether_portal

execute as @s[tag=in_tar] positioned as @s run setblock ~1 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @e[distance=..1.7,tag=!target_point] run function magic_commons:exit_tar"}
execute as @s[tag=in_tar] positioned as @s run setblock ~2 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @e[distance=..1.7,tag=!target_point] run function magic_commons:exit_tar"}

execute as @s[tag=!in_tar] positioned as @s run setblock ~1 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @e[distance=..1.7,tag=!target_point] run function magic_commons:enter_tar"}
execute as @s[tag=!in_tar] positioned as @s run setblock ~2 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @e[distance=..1.7,tag=!target_point] run function magic_commons:enter_tar"}

#Set position to return
scoreboard players operation @s destination_x = @s return_x
scoreboard players operation @s destination_y = @s return_y
scoreboard players operation @s destination_z = @s return_z

tag @s add gateway_end
tag @s remove gateway_end_temp

#To make work with sense + bypass some other stuff
tag @s add target_point

#Somehow this works but not quick enough, that is why I need to have execute in magic_commons:tar before this function
#This seems to mess with other stuff, putting down here for now
execute as @s[tag=in_tar] positioned as @s in magic_commons:tar run tp @s ~ ~ ~
execute as @s[tag=!in_tar] positioned as @s in minecraft:overworld run tp @s ~ ~ ~
