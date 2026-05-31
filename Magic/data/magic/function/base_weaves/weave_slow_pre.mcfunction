#Clutter to prevent nothing on next line from rolling over causing decently powerfull

scoreboard players set @s reg_1 0
scoreboard players set Temp reg_1 1
execute if score @s weave_read_index matches 1.. run function magic:weave_processing/count_weave_single

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
execute store result storage magic:slow amount int 1 run scoreboard players get @s reg_1
execute as @e if score @s entity_id = Temp reg_1 run function magic:base_weaves/weave_slow with storage magic:slow

function magic:weave_processing/advance_read_index

data remove storage magic:slow amount

tag @s add weave_slow