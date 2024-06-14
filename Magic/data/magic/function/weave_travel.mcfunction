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

setblock ~1 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @a[distance=..1.7] run function magic:travel"}
setblock ~2 ~-2 ~ repeating_command_block{auto:1b,conditional:1b,Command:"execute as @a[distance=..1.7] run function magic:travel"}

scoreboard players operation Temp reg_1 = @s player_id

execute as @a[sort=nearest, tag=using, tag=can_use] if score @s player_id = Temp reg_1 run tag @s add travel_owner

scoreboard players operation @s destination_x = @a[limit=1,tag=using,tag=can_use,tag=travel_owner] destination_x
scoreboard players operation @s destination_y = @a[limit=1,tag=using,tag=can_use,tag=travel_owner] destination_y
scoreboard players operation @s destination_z = @a[limit=1,tag=using,tag=can_use,tag=travel_owner] destination_z


scoreboard players operation @s weave_execute_random_number = #random_id player_id
scoreboard players add #random_id player_id 1

summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Invisible:1b,Marker:1b, Tags:["gateway_end_temp"]}
#summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Tags:["gateway_end_temp"]}

scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] weave_execute_random_number = @s weave_execute_random_number

scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_1 = @s t_1
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_2 = @s t_2
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_3 = @s t_3
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_4 = @s t_4
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_5 = @s t_5
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_6 = @s t_6
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_7 = @s t_7
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_8 = @s t_8
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_9 = @s t_9
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_10 = @s t_10
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_11 = @s t_11
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_12 = @s t_12
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_13 = @s t_13
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_14 = @s t_14
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_15 = @s t_15
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_16 = @s t_16
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_17 = @s t_17
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_18 = @s t_18
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_19 = @s t_19
scoreboard players operation @e[tag=gateway_end_temp,limit=1,sort=nearest] t_20 = @s t_20

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

tag @a remove travel_owner

tag @s add holds_travel

#Need to be below holds travel
execute as @e[limit=1,sort=nearest,type=armor_stand,tag=gateway_end_temp] at @s run function magic:opposite_gateway

scoreboard players add @s destination_z 2