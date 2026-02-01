function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute if score @s reg_1 = @s weave_air_count run tag @s add weave_lightning_shield

scoreboard players operation @s weave_lightning_shield_count = @s weave_air_count

function magic:weave_processing/advance_read_index
