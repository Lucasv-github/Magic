function magic:weave_processing/advance_read_index

scoreboard players operation @s reg_1 = @s weave_fire_count
scoreboard players operation @s reg_1 /= 5 reg_1  
execute store result storage magic:weave_size size int 1 run scoreboard players get @s reg_1 

function magic:base_weaves/weave_land_fireball with storage magic:weave_size

tag @s add weave_damaged