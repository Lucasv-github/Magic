################################################################################
#Purpose: Check direct pattern match between weave and provided storage
#Arguments: Temp reg_1: match_storage_index
#Runner: An armorstand holding a weave checking for a pattern match, run via weaves.mcfunction
#Return values: @s reg_1: matched
#Authors: Lprogrammer
################################################################################

execute store result storage magic:match_weave_iteration match_index int 1 run scoreboard players get Temp reg_1
execute store result storage magic:match_weave_iteration index int 1 run scoreboard players get @s player_weave_index

execute store result storage magic:match_weave_iteration i int 1 run scoreboard players get @s weave_read_index
execute store result storage magic:match_weave_iteration j int 1 run scoreboard players get 0 reg_1

scoreboard players set @s reg_1 1
function magic:weave_processing/match_weave_iteration with storage magic:match_weave_iteration

data remove storage magic:match_weave_iteration match_index
data remove storage magic:match_weave_iteration index
data remove storage magic:match_weave_iteration i
data remove storage magic:match_weave_iteration j


