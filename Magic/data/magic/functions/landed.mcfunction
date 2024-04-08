#summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Invisible:0b,Marker:0b}
summon armor_stand ~ ~ ~ {Invulnerable:1b, NoGravity:1b, NoGravity:1b, Invisible:1b,Marker:1b}

scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s player_weave_index_current

execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] run scoreboard players operation @s player_id = Temp reg_1
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] run scoreboard players operation @s player_weave_index = Temp reg_2

#Wards
scoreboard players operation Temp reg_1 = @s player_id
execute as @e[distance=..10,tag=tied_off,scores={weave_remaining_time=1..,t_1=5,t_2=1,t_3=5,t_4=1,t_5=5,t_6=0}] if score @s player_id = Temp reg_1 run tag @e[sort=nearest,limit=1, type=minecraft:armor_stand] add ward_connected
execute as @e[distance=..10,tag=tied_off,scores={weave_remaining_time=1..,t_1=5,t_2=1,t_3=2,t_4=1,t_5=5,t_6=0}] if score @s player_id = Temp reg_1 run tag @e[sort=nearest,limit=1, type=minecraft:armor_stand] add ward_connected

#Disguise
execute as @a[tag=using,tag=can_use,scores={invert=1..}] if score @s player_id = @e[sort=nearest,limit=1, type=minecraft:armor_stand] player_id run tag @e[sort=nearest,limit=1, type=minecraft:armor_stand] add inverted

scoreboard players operation Temp_1 reg_1 = @s player_id

execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] at @s[tag=!inverted] run particle minecraft:glow ~ ~2 ~ 0 0 0 0 10 normal @a[tag=can_see]

execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] store result score @s position_x run data get entity @s Pos[0]
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] store result score @s position_y run data get entity @s Pos[1]
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] store result score @s position_z run data get entity @s Pos[2]

#Grap position for gateway
execute as @a[tag=using,tag=can_use,scores={destination=1..}] if score @s player_id = Temp reg_1 store result score @s destination_x run data get entity @e[sort=nearest,limit=1, type=minecraft:armor_stand] Pos[0]
execute as @a[tag=using,tag=can_use,scores={destination=1..}] if score @s player_id = Temp reg_1 store result score @s destination_y run data get entity @e[sort=nearest,limit=1, type=minecraft:armor_stand] Pos[1]
execute as @a[tag=using,tag=can_use,scores={destination=1..}] if score @s player_id = Temp reg_1 store result score @s destination_z run data get entity @e[sort=nearest,limit=1, type=minecraft:armor_stand] Pos[2]
execute as @a[tag=using,tag=can_use,scores={destination=1..}] if score @s player_id = Temp reg_1 run scoreboard players set @s destination 0

tag @e[sort=nearest,limit=1, type=minecraft:armor_stand] add target_point
#Not affected by a weave currently
tag @e[sort=nearest,limit=1, type=minecraft:armor_stand] add actively_held

#Still we should lock neareset player
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] run scoreboard players operation @s weave_execute_id = @a[limit=1, sort=nearest, distance=..5] player_id

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp_1 reg_1 run function magic:resync


#Things triggered by arrow imidiately should also use force

#Run weave when landed
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] as @a[tag=using,tag=can_use,tag=built] if score @s player_id = Temp_1 reg_1 run function magic:holding_run_first

#Cutting bypass
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] if entity @s[scores={t_1=5,t_2=3,t_3=2,t_4=0}] run tag @s remove ward_connected
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] if entity @s[scores={t_1=1,t_2=3,t_3=0}] run tag @s remove ward_connected

execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] if entity @s[scores={t_1=5,t_2=3,t_3=2,t_4=0}] as @a[tag=using,tag=can_use,tag=built] if score @s player_id = Temp_1 reg_1 run function magic:holding_run_first
execute as @e[sort=nearest,limit=1, type=minecraft:armor_stand] if entity @s[scores={t_1=1,t_2=3,t_3=0}] as @a[tag=using,tag=can_use,tag=built] if score @s player_id = Temp_1 reg_1 run function magic:holding_run_first

#Handle legacy
kill @s[tag=ray]