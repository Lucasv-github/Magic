################################################################################
#Purpose: Create entry and link it to an exit gateways for a TAR travel weave
#Runner: An armorstand holding a TAR travel weave
#Return values:
#Authors: Lprogrammer
################################################################################

forceload add ~ ~

execute store result score @s reg_1 run data get entity @s Pos[0]
execute store result score @s reg_2 run data get entity @s Pos[2]

scoreboard players operation @s reg_1 /= 16 reg_1
scoreboard players operation @s reg_2 /= 16 reg_1

execute unless score @s tar_current_chunk_x = @s reg_1 run scoreboard players set @s reg_3 1
execute unless score @s tar_current_chunk_y = @s reg_2 run scoreboard players set @s reg_3 1

execute unless score @s tar_current_chunk_x = @s reg_1 run scoreboard players operation @s tar_current_chunk_x = @s reg_1
execute unless score @s tar_current_chunk_y = @s reg_2 run scoreboard players operation @s tar_current_chunk_y = @s reg_2

scoreboard players operation @s reg_1 *= 16 reg_1
scoreboard players operation @s reg_2 *= 16 reg_1

scoreboard players operation @s reg_1 *= 16 reg_1
scoreboard players operation @s reg_2 *= 16 reg_1
scoreboard players operation @s reg_3 = @s weave_owner_player_id
execute if dimension minecraft:overworld run function magic_commons:copy_chunks_tar_imidiately


scoreboard players operation @s reg_1 = @s destination_x
scoreboard players operation @s reg_2 = @s destination_z

scoreboard players operation @s reg_1 /= 16 reg_1
scoreboard players operation @s reg_2 /= 16 reg_1


execute unless score @s tar_current_chunk_x = @s reg_1 run scoreboard players set @s reg_3 1
execute unless score @s tar_current_chunk_y = @s reg_2 run scoreboard players set @s reg_3 1

execute unless score @s tar_current_chunk_x = @s reg_1 run scoreboard players operation @s tar_current_chunk_x = @s reg_1
execute unless score @s tar_current_chunk_y = @s reg_2 run scoreboard players operation @s tar_current_chunk_y = @s reg_2

scoreboard players operation @s reg_1 *= 16 reg_1
scoreboard players operation @s reg_2 *= 16 reg_1
scoreboard players operation @s reg_3 = @s weave_owner_player_id

execute if dimension minecraft:overworld run function magic_commons:copy_chunks_tar_imidiately

#Need to lock these to prevent removing until gateway is removed
#This prevents the chunks from being unloaded until the gateway is removed even if the player reeenters the overworld
scoreboard players operation Temp reg_1 = @s weave_owner_player_id
scoreboard players operation Temp reg_2 = @s player_weave_index
execute if dimension minecraft:overworld in minecraft:overworld positioned 0 -80 0 as @e[type=minecraft:armor_stand,distance=..1,tag=tar_chunk_loaded_marker] if score @s player_id = Temp reg_1 run tag @s add gateway_blocked
execute if dimension minecraft:overworld in minecraft:overworld positioned 0 -80 0 as @e[type=minecraft:armor_stand,distance=..1,tag=tar_chunk_loaded_marker] if score @s player_id = Temp reg_1 run scoreboard players operation @s player_weave_index = Temp reg_2

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

execute if dimension magic_commons:tar run setblock ~1 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @a[distance=..1.7] run function magic_commons:exit_tar"}
execute if dimension magic_commons:tar run setblock ~2 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @a[distance=..1.7] run function magic_commons:exit_tar"}

execute if dimension minecraft:overworld run setblock ~1 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @a[distance=..1.7] run function magic_commons:enter_tar"}
execute if dimension minecraft:overworld run setblock ~2 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @a[distance=..1.7] run function magic_commons:enter_tar"}



summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Invisible:1b,Marker:1b, Tags:["gateway_end_temp"]}
#summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Tags:["gateway_end_temp"]}

scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] player_weave_index = @s player_weave_index


scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] position_x = @s destination_x
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] position_y = @s destination_y
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] position_z = @s destination_z

scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] destination_x = @s destination_x
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] destination_y = @s destination_y
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] destination_z = @s destination_z
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] current_held = @s current_held

#These are just spoofed, the gateway will be removed another way (the opposite won't basically run out)
scoreboard players set @e[tag=gateway_end_temp,limit=1,sort=nearest] weave_remaining_time 1000000000
scoreboard players set @e[tag=gateway_end_temp,limit=1,sort=nearest] state 2

execute store result score @e[tag=gateway_end_temp,limit=1,sort=nearest] return_x run data get entity @s Pos[0]
execute store result score @e[tag=gateway_end_temp,limit=1,sort=nearest] return_y run data get entity @s Pos[1]
execute store result score @e[tag=gateway_end_temp,limit=1,sort=nearest] return_z run data get entity @s Pos[2]
#tag @a remove travel_owner

tag @s add holds_travel


#Can't use the detection on the other side as we techincally aren't in tar
#TODO figur out if this is necessary or if I am stupid
execute if dimension minecraft:overworld run tag @e[limit=1,sort=nearest,type=armor_stand,tag=gateway_end_temp] add in_tar

#Need to be below holds travel
execute if dimension minecraft:overworld as @e[limit=1,sort=nearest,type=armor_stand,tag=gateway_end_temp] at @s in magic_commons:tar run function magic:weave_actions/opposite_gateway_tar
execute if dimension magic_commons:tar as @e[limit=1,sort=nearest,type=armor_stand,tag=gateway_end_temp] at @s in minecraft:overworld run function magic:weave_actions/opposite_gateway_tar