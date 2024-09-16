tag @s add weave_bridge_temp_works

scoreboard players set @s weave_bridge_count 0

execute as @s[scores={weave_read_index=1..}] run function magic:base_weaves/weave_bridge_iteration with storage magic:weave_size

scoreboard players operation Temp reg_1 = @s weave_bridge_count
scoreboard players operation Temp reg_2 = @s player_id
scoreboard players operation Temp reg_3 = @s player_weave_index

tag @s add weave_bridge_need_armor_stand_temp

execute as @e[tag=bridge_start,type=armor_stand] if score @s player_weave_index = Temp reg_3 run tag @e remove weave_bridge_need_armor_stand_temp

execute as @s[tag=weave_bridge_temp_works,tag=weave_bridge_need_armor_stand_temp] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["bridge_start"],NoGravity:1b,Marker:1b,Invisible:1b}
execute as @s[tag=weave_bridge_temp_works,tag=weave_bridge_need_armor_stand_temp] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 at @s run scoreboard players operation @e[tag=bridge_start,type=armor_stand,limit=1,sort=nearest] player_weave_index = Temp reg_3

tag @s remove weave_bridge_need_armor_stand_temp

execute at @s[tag=weave_bridge_temp_works] as @e[tag=bridge_start,type=armor_stand] if score @s player_weave_index = Temp reg_3 run function magic:build_bridge with storage magic:weave_size
tag @s[tag=weave_bridge_temp_works] add weave_bridge

tag @s remove weave_bridge_temp_works