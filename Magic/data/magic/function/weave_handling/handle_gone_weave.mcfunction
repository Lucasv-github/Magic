################################################################################
#Purpose: Take appropriate action when a player has lost a weave without dropping the item
#Runner: A player who has lost a weave without dropping it
#Return values:
#Authors: Lprogrammer
################################################################################
scoreboard players set Temp reg_1 0

execute store result storage magic:handle_gone_weave_sub i int 1 run scoreboard players get Temp reg_1
execute store result storage magic:handle_gone_weave_sub player_id int 1 run scoreboard players get @s player_id
function magic:weave_handling/handle_gone_weave_sub with storage magic:handle_gone_weave_sub

data remove storage magic:handle_gone_weave_sub i
data remove storage magic:handle_gone_weave_sub player_id

data remove storage magic:has_weave player_weave_index

data remove storage magic:remove_weave_data index