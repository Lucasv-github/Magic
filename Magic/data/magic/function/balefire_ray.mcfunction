particle minecraft:snowflake ~ ~ ~ 0 0 0 0 200

$fill $(size) $(size) $(size) -$(size) -$(size) -$(size) glass replace #magic:balefire_destroyable

tag @s add balefire_ray_not_me

#TODO target point remove weave
$execute as @e[distance=..$(size),tag=!balefire_ray_not_me,tag=!target_point] run function magic:ban
$execute as @e[distance=..$(size),tag=!balefire_ray_not_me,tag=!target_point] run tp @s ~ ~-10000 ~

tag @s remove balefire_ray_not_me

scoreboard players remove Temp reg_1 1
execute if score Temp reg_1 matches 1.. if entity @s[distance=1..] facing entity @s eyes positioned ^ ^ ^0.5 run function magic:balefire_ray with storage magic:weave_size