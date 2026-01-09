################################################################################
#Purpose: Add a newline to a weave present in the 9:th slot, then correct hands
#Runner: An entity adding a newline by using their offhand, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute at @s run playsound minecraft:entity.sniffer.drop_seed player @s

function magic:inventory/swap_hands

execute store result storage magic:weave_storage_add_data index int 1 run scoreboard players get @s player_weave_index

#-1 for newline
scoreboard players set @s reg_1 -1
function magic:weave_handling/weave_storage_add_data with storage magic:weave_storage_add_data