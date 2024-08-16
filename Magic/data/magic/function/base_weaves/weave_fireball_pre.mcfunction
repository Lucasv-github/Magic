#TODO random should destabilize

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute store result storage magic:weave_size size int 1 run scoreboard players get @s reg_1

function magic:base_weaves/weave_fireball with storage magic:weave_size

function magic:weave_processing/advance_read_index