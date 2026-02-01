#TODO random should destabilize

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute store result storage magic:weave_size size int 1 run scoreboard players get @s reg_1

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id

execute as @e[tag=using,tag=can_use] if score @s entity_id = Temp reg_1 at @s run function magic:base_weaves/weave_launch_fireball with storage magic:weave_size

function magic:weave_processing/advance_read_index

tag @s add weave_damaged