#Air
scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_air_count_n = @s reg_1

#Fire
scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_fire_count_n = @s reg_1

#n=1.. prevents zero on last lapse
$execute as @s[scores={weave_air_count_n=1..,weave_fire_count_n=1}] unless score @s weave_air_count_n matches $(size) run tag @s remove weave_bridge_temp_works
$execute as @s[scores={weave_air_count_n=1..,weave_fire_count_n=1}] if score @s weave_air_count_n matches $(size) run scoreboard players add @s weave_bridge_count 1

function magic:weave_processing/advance_read_index

execute as @s[scores={weave_read_index=1..}] run function magic:base_weaves/weave_bridge_iteration with storage magic:weave_size

