#Clutter to prevent FFF from making a decent explosing

scoreboard players set @s reg_1 0
scoreboard players set Temp reg_1 3
execute if score @s weave_read_index matches 1.. run function magic:weave_processing/count_weave_single

scoreboard players operation @s reg_1 /= 10 reg_1

execute store result storage magic:weave_size size int 1 run scoreboard players get @s reg_1

function magic:base_weaves/weave_fireball with storage magic:weave_size

function magic:weave_processing/advance_read_index

tag @s add weave_damaged