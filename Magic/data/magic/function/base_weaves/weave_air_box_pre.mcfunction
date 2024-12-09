function magic:weave_processing/advance_read_index


scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute as @s if score @s weave_air_count = @s reg_1 run tag @s add weave_air_box_temp_works
execute as @s[scores={weave_read_index=0}] run tag @s remove weave_air_box_temp_works

function magic:weave_processing/advance_read_index


scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_air_count = @s reg_1 run tag @s remove weave_air_box_temp_works
execute as @s[scores={weave_read_index=0}] run tag @s remove weave_air_box_temp_works

function magic:weave_processing/advance_read_index


scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_air_count = @s reg_1 run tag @s remove weave_air_box_temp_works
execute as @s[scores={weave_read_index=0}] run tag @s remove weave_air_box_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_air_count = @s reg_1 run tag @s remove weave_air_box_temp_works
execute as @s[scores={weave_read_index=0}] run tag @s remove weave_air_box_temp_works

function magic:weave_processing/advance_read_index

scoreboard players operation Temp reg_1 = @s weave_air_count
function magic:math/square_root

execute store result storage magic:air_box size_1 int 1 run scoreboard players get Temp reg_1
scoreboard players remove Temp reg_1 1
execute store result storage magic:air_box size int 1 run scoreboard players get Temp reg_1

execute at @s[tag=weave_air_box_temp_works] run function magic:base_weaves/weave_air_box with storage magic:air_box
execute at @s[tag=weave_air_box_temp_works] run tag @s add weave_air_box

tag @s remove weave_air_box_temp_works


