################################################################################
#Purpose: Add a newline to a weave present in the 9:th slot, then correct hands
#Runner: An entity adding a newline by using their offhand, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute at @s run playsound minecraft:entity.sniffer.drop_seed player @s

function magic:inventory/swap_hands

#Used to this in chat
scoreboard players remove @s weave_length 1

scoreboard players set @s reg_1 -1
function magic:weave_handling/add_element