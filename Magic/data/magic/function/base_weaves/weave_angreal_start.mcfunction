function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute if score @s reg_1 = @s weave_earth_count run tag @s add weave_angreal_start_temp

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute unless score @s reg_1 = @s weave_earth_count run tag @s remove weave_angreal_start_temp

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute unless score @s reg_1 = @s weave_earth_count run tag @s remove weave_angreal_start_temp

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute unless score @s reg_1 = @s weave_earth_count run tag @s remove weave_angreal_start_temp

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 2
function magic:weave_processing/count_weave_single

execute unless score @s reg_1 = @s weave_earth_count run tag @s remove weave_angreal_start_temp

execute as @s[tag=weave_angreal_start_temp] at @s as @e[limit=1,sort=nearest,type=item_frame] run function magic:power_handling/create_angreal

function magic:weave_processing/advance_read_index

tag @s remove weave_angreal_start_temp