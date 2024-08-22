scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute at @s[scores={reg_1=1}] run summon minecraft:snowball ~ ~2 ~ {Motion:[1.0,0.0,0.0],Tags:["weave_thrower_temp"]}
execute at @s[scores={reg_1=2}] run summon minecraft:snowball ~ ~2 ~ {Motion:[-1.0,0.0,0.0],Tags:["weave_thrower_temp"]}
execute at @s[scores={reg_1=3}] run summon minecraft:snowball ~ ~2 ~ {Motion:[0.0,1.0,0.0],Tags:["weave_thrower_temp"]}
execute at @s[scores={reg_1=4}] run summon minecraft:snowball ~ ~2 ~ {Motion:[0.0,-1.0,0.0],Tags:["weave_thrower_temp"]}
execute at @s[scores={reg_1=5}] run summon minecraft:snowball ~ ~2 ~ {Motion:[0.0,0.0,1.0],Tags:["weave_thrower_temp"]}
execute at @s[scores={reg_1=6}] run summon minecraft:snowball ~ ~2 ~ {Motion:[0.0,0.0,-1.0],Tags:["weave_thrower_temp"]}

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
scoreboard players operation @e[limit=1,type=minecraft:snowball,tag=weave_thrower_temp] weave_locked_entity_id = Temp reg_1
tag @e[limit=1,type=minecraft:snowball,tag=weave_thrower_temp] add weave_thrower

tag @e[type=snowball] remove weave_thrower_temp

function magic:weave_processing/advance_read_index

tag @s add weave_throw
#tag @s add weave_damaged