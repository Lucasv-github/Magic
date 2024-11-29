scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
execute store result storage magic:levitate amount int 1 run scoreboard players get @s reg_1
execute as @e if score @s entity_id = Temp reg_1 run function magic:base_weaves/weave_levitate with storage magic:levitate

function magic:weave_processing/advance_read_index