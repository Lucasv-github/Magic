#Will count Temp reg_1, and return in @s reg_1

execute store result storage magic:count_weave_single_iteration index int 1 run scoreboard players get @s player_weave_index
execute store result storage magic:count_weave_single_iteration i int 1 run scoreboard players get @s weave_read_index

scoreboard players set @s reg_1 0
function magic:weave_processing/count_weave_single_iteration with storage magic:count_weave_single_iteration
