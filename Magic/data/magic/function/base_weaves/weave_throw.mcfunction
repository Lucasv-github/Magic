scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
scoreboard players operation Temp reg_2 = @s player_weave_index

execute as @e[type=minecraft:snowball,tag=weave_thrower] if score @s player_weave_index = Temp reg_2 run tag @s add weave_throw_exists_temp

#Limit @e checks a bit
execute if entity @e[tag=weave_throw_exists_temp] run tag @s add weave_throw_exists_temp

execute at @s[tag=!weave_throw_exists_temp,scores={reg_1=2}] run summon minecraft:snowball ~ ~2 ~ {Motion:[-1.0,0.0,0.0],Tags:["weave_thrower_temp"]}
execute at @s[tag=!weave_throw_exists_temp,scores={reg_1=1}] run summon minecraft:snowball ~ ~2 ~ {Motion:[1.0,0.0,0.0],Tags:["weave_thrower_temp"]}
execute at @s[tag=!weave_throw_exists_temp,scores={reg_1=3}] run summon minecraft:snowball ~ ~2 ~ {Motion:[0.0,-1.0,0.0],Tags:["weave_thrower_temp"]}
execute at @s[tag=!weave_throw_exists_temp,scores={reg_1=4}] run summon minecraft:snowball ~ ~2 ~ {Motion:[0.0,1.0,0.0],Tags:["weave_thrower_temp"]}
execute at @s[tag=!weave_throw_exists_temp,scores={reg_1=5}] run summon minecraft:snowball ~ ~2 ~ {Motion:[0.0,0.0,-1.0],Tags:["weave_thrower_temp"]}
execute at @s[tag=!weave_throw_exists_temp,scores={reg_1=6}] run summon minecraft:snowball ~ ~2 ~ {Motion:[0.0,0.0,1.0],Tags:["weave_thrower_temp"]}

scoreboard players operation Temp reg_3 = @s weave_owner_player_id
execute at @s[tag=!weave_throw_exists_temp,scores={reg_1=10}] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_3 at @s run function magic:base_weaves/weave_launch_throw

tag @e remove weave_throw_exists_temp

scoreboard players operation @e[limit=1,type=minecraft:snowball,tag=weave_thrower_temp] weave_locked_entity_id = Temp reg_1
scoreboard players operation @e[limit=1,type=minecraft:snowball,tag=weave_thrower_temp] player_weave_index = Temp reg_2
tag @e[limit=1,type=minecraft:snowball,tag=weave_thrower_temp] add weave_thrower

tag @e[type=snowball] remove weave_thrower_temp

function magic:weave_processing/advance_read_index

tag @s add weave_throw

#Can't use this as it instantly removes snowball
#tag @s add weave_damaged
tag @s add weave_throw_damaged