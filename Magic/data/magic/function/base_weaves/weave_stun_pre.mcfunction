#TODO random should destabilize

scoreboard players set Temp reg_1 5
scoreboard players set Temp reg_2 3
function magic:weave_processing/count_weave_double

execute store result storage magic:weave_size size int 1 run scoreboard players get @s reg_1

function magic:base_weaves/weave_stun with storage magic:weave_size

function magic:weave_processing/advance_read_index with storage magic:weave_size

tag @s add weave_stun