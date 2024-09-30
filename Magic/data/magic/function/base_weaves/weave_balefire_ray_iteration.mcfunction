say wbri

#Air
scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_air_count_n = @s reg_1

#Earth
scoreboard players set Temp reg_1 2
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_earth_count_n = @s reg_1

#Fire
scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_fire_count_n = @s reg_1

#Spirit
scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_spirit_count_n = @s reg_1

#Make comparison easier
scoreboard players operation @s weave_spirit_count_n /= 4 reg_1

$execute as @s unless score @s[scores={weave_air_count_n=1..,weave_earth_count=1..,weave_fire_count_n=1..,weave_spirit_count_n=1..}] weave_air_count_n matches $(size) run tag @s remove weave_balefire_ray_temp_works
$execute as @s unless score @s[scores={weave_air_count_n=1..,weave_earth_count=1..,weave_fire_count_n=1..,weave_spirit_count_n=1..}] weave_fire_count_n matches $(size) run tag @s remove weave_balefire_ray_temp_works
$execute as @s unless score @s[scores={weave_air_count_n=1..,weave_earth_count=1..,weave_fire_count_n=1..,weave_spirit_count_n=1..}] weave_earth_count_n matches $(size) run tag @s remove weave_balefire_ray_temp_works
$execute as @s unless score @s[scores={weave_air_count_n=1..,weave_earth_count=1..,weave_fire_count_n=1..,weave_spirit_count_n=1..}] weave_spirit_count_n matches $(size) run tag @s remove weave_balefire_ray_temp_works

$execute as @s if score @s weave_air_count_n matches $(size) if score @s weave_air_count_n matches $(size) if score @s weave_earth_count_n matches $(size) if score @s weave_spirit_count_n matches $(size) run scoreboard players add @s weave_balefire_ray_count 1

function magic:weave_processing/advance_read_index

execute as @s[scores={weave_read_index=1..}] run function magic:base_weaves/weave_balefire_ray_iteration with storage magic:weave_size

