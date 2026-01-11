################################################################################
#Purpose: Add a newline to a weave present in the 9:th slot
#Runner: An entity adding a newline by /trigger line, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Can only add line to weave in slot 9
#This should not be run when an item is placed in the offhand, as this doesn't handle that like holding_add_line does

execute store result storage magic:weave_storage_add_data index int 1 run scoreboard players get @s player_weave_index

execute at @s run playsound minecraft:entity.sniffer.drop_seed player @s

#-1 for newline
scoreboard players set @s reg_1 -1
function magic:weave_handling/weave_storage_add_data with storage magic:weave_storage_add_data

scoreboard players set @s line 0
