################################################################################
#Purpose: Count the number of specified element type until newline or end
#Arguments: Temp reg_1: element_to_match
#Runner: An armorstand decoding its contained weave and counting single elements
#Return values: @s reg_1: Count
#Authors: Lprogrammer
################################################################################

execute store result storage magic:count_weave_single_iteration index int 1 run scoreboard players get @s player_weave_index
execute store result storage magic:count_weave_single_iteration i int 1 run scoreboard players get @s weave_read_index

scoreboard players set @s reg_1 0
function magic:weave_processing/count_weave_single_iteration with storage magic:count_weave_single_iteration
