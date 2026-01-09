################################################################################
#Purpose: Advance the weave read_index to after the next newline (-1)
#Runner: An armorstand decoding its contained weave
#Return values:
#Authors: Lprogrammer
################################################################################

execute store result storage magic:weave_processing/advance_read_index_iteration index int 1 run scoreboard players get @s player_weave_index
execute store result storage magic:weave_processing/advance_read_index_iteration i int 1 run scoreboard players get @s weave_read_index

scoreboard players set @s reg_1 0
function magic:weave_processing/advance_read_index_iteration with storage magic:weave_processing/advance_read_index_iteration
