function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 2
function magic:weave_processing/count_weave_single

execute if score @s reg_1 = @s weave_spirit_count run function magic:weave_actions/cut_weave_built
function magic:weave_processing/advance_read_index

tag @s add weave_damaged