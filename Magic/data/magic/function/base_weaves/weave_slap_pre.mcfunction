scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id
execute as @e[tag=using,tag=can_use] if score @s entity_id = Temp reg_1 run tag @s add slapper

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
execute store result storage magic:damage amount int 1 run scoreboard players get @s reg_1
execute as @e if score @s entity_id = Temp reg_1 run function magic:base_weaves/weave_slap with storage magic:damage

data remove storage magic:damage amount

function magic:weave_processing/advance_read_index

tag @s add weave_slap

tag @a remove slapper