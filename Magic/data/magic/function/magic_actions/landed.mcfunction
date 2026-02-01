################################################################################
#Purpose: Place an armorstand at the position where the weave ray landed and prepare to decode and execute the corresponding weave
#Runner: The entity who launced the weave, with the position context of where the weave_ray ended
#Return values:
#Authors: Lprogrammer
################################################################################

#summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Invisible:0b,Marker:0b,Tags:["temp_target_point"]}
summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Invisible:1b,Marker:1b,Tags:["temp_target_point"]}

forceload add ~ ~

scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_3 = @s cumulative_halve_amount_hold
scoreboard players operation Temp reg_4 = @s tie_strength
scoreboard players operation Temp reg_5 = @s entity_id

execute store result score Temp reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index

#Use player_weave_index if non selected
execute if score Temp reg_2 matches 0 run scoreboard players operation Temp reg_2 = @s player_weave_index

execute as @s[type=!player] run tag @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] add nonplayer_origin

execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run scoreboard players operation @s weave_owner_player_id = Temp reg_1
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run scoreboard players operation @s player_weave_index = Temp reg_2
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run scoreboard players operation @s cumulative_halve_amount_hold = Temp reg_3
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run scoreboard players operation @s tie_strength = Temp reg_4
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run scoreboard players operation @s weave_owner_entity_id = Temp reg_5
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run scoreboard players set @s weave_read_index 0

scoreboard players operation Temp_1 reg_1 = @s player_id

execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] at @s[tag=!inverted] run particle minecraft:glow ~ ~2 ~ 0 0 0 0 10 normal @a[tag=can_see]

execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] store result score @s position_x run data get entity @s Pos[0]
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] store result score @s position_y run data get entity @s Pos[1]
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] store result score @s position_z run data get entity @s Pos[2]

tag @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] add target_point

#Type used to determine which type of power as target_point is common between all
tag @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] add type
#Not affected by a weave currently
tag @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] add actively_held

scoreboard players set @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] weave_locked_player_id 0
scoreboard players set @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] weave_locked_entity_id 0

#Lock on neareset player
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run scoreboard players operation @s weave_locked_player_id = @a[limit=1, sort=nearest, distance=..5] player_id

#Also lock on nearest entity
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run scoreboard players operation @s weave_locked_entity_id = @e[limit=1, sort=nearest, distance=..5,tag=!target_point] entity_id

execute as @s unless score @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] weave_locked_entity_id matches 0 as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 at @s run playsound minecraft:block.iron_door.close ambient @s
execute as @s unless score @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] weave_locked_player_id matches 0 as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 at @s run playsound minecraft:block.iron_door.close ambient @s

execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand,tag=temp_target_point] run function magic:pre_weaves

tag @e[tag=target_point,type=armor_stand] remove temp_target_point
