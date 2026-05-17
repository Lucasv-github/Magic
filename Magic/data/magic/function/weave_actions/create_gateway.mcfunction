################################################################################
#Purpose: Create entry and link it to an exit gateways for a travel weave
#Runner: An armorstand holding a travel weave
#Arguments: Destination coordinates in Temp destination_x, destination_y, destination_z
#Return values:
#Authors: Lprogrammer
################################################################################

forceload add ~ ~

setblock ~ ~ ~ minecraft:barrier
setblock ~ ~1 ~ minecraft:barrier
setblock ~ ~2 ~ minecraft:barrier
setblock ~3 ~ ~ minecraft:barrier
setblock ~3 ~1 ~ minecraft:barrier
setblock ~3 ~2 ~ minecraft:barrier

#Top
setblock ~1 ~3 ~ minecraft:barrier
setblock ~2 ~3 ~ minecraft:barrier

#Bottom
setblock ~ ~-1 ~ minecraft:barrier
setblock ~3 ~-1 ~ minecraft:barrier
setblock ~1 ~-1 ~ minecraft:barrier
setblock ~2 ~-1 ~ minecraft:barrier

#Portal
setblock ~1 ~2 ~ minecraft:nether_portal
setblock ~2 ~2 ~ minecraft:nether_portal
setblock ~1 ~1 ~ minecraft:nether_portal
setblock ~2 ~1 ~ minecraft:nether_portal
setblock ~1 ~0 ~ minecraft:nether_portal
setblock ~2 ~0 ~ minecraft:nether_portal

setblock ~1 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @e[distance=..1.7,tag=!target_point] run function magic:magic_actions/travel"}
setblock ~2 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @e[distance=..1.7,tag=!target_point] run function magic:magic_actions/travel"}

summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Invisible:1b,Marker:1b, Tags:["gateway_end_temp"]}
#summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Tags:["gateway_end_temp"]}

scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] player_weave_index = @s player_weave_index

scoreboard players operation @s destination_x = Temp destination_x
scoreboard players operation @s destination_y = Temp destination_y
scoreboard players operation @s destination_z = Temp destination_z

scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] position_x = Temp destination_x
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] position_y = Temp destination_y
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] position_z = Temp destination_z

scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] destination_x = Temp destination_x
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] destination_y = Temp destination_y
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] destination_z = Temp destination_z
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] current_held = @s current_held

#These are just spoofed, the gateway will be removed another way (the opposite won't basically run out)
scoreboard players set @e[tag=gateway_end_temp,limit=1,sort=nearest] weave_remaining_time 1000000000
scoreboard players set @e[tag=gateway_end_temp,limit=1,sort=nearest] state 2

execute store result score Temp return_x run data get entity @s Pos[0]
execute store result score Temp return_y run data get entity @s Pos[1]
execute store result score Temp return_z run data get entity @s Pos[2]

scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] return_x = Temp return_x
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] return_y = Temp return_y
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] return_z = Temp return_z
#tag @a remove travel_owner

scoreboard players operation Temp reg_1 = Temp destination_x
scoreboard players operation Temp reg_1 -= Temp return_x
scoreboard players operation Temp reg_1 *= Temp reg_1

scoreboard players operation Temp reg_2 = Temp destination_y
scoreboard players operation Temp reg_2 -= Temp return_y
scoreboard players operation Temp reg_2 *= Temp reg_2

scoreboard players operation Temp reg_3 = Temp destination_z
scoreboard players operation Temp reg_3 -= Temp return_z
scoreboard players operation Temp reg_3 *= Temp reg_3

scoreboard players operation Temp reg_1 += Temp reg_2
scoreboard players operation Temp reg_1 += Temp reg_3

function magic:math/square_root

#tellraw @p ["",{text:"Travel cost: ",bold:true,color:"dark_red"},{score:{name:"Temp",objective:"reg_1"}}]
scoreboard players operation @s current_drain += Temp reg_1

tag @s add holds_travel

#Need to be below holds travel
execute as @e[limit=1,sort=nearest,type=armor_stand,tag=gateway_end_temp] at @s run function magic:weave_actions/opposite_gateway

scoreboard players add @s destination_z 2