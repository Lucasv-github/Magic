################################################################################
#Purpose: Count the number of specified element combinations until newline or end
#Arguments: Temp reg_1: element_1 Temp reg_2: element_2
#Runner: An armorstand decoding its contained weave and counting 2 element combinations
#Return values: @s reg_1: Count
#Authors: Lprogrammer
################################################################################

execute store result storage magic:count_weave_double_iteration index int 1 run scoreboard players get @s player_weave_index
execute store result storage magic:count_weave_double_iteration i int 1 run scoreboard players get @s weave_read_index

#Need to get index+1 but can't modify weave_read_index
scoreboard players operation @s reg_1 = @s weave_read_index
scoreboard players add @s reg_1 1

execute store result storage magic:count_weave_double_iteration i_1 int 1 run scoreboard players get @s reg_1

scoreboard players set @s reg_1 0
function magic:weave_processing/count_weave_double_iteration with storage magic:count_weave_double_iteration
