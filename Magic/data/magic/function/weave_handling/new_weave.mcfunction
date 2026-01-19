################################################################################
#Purpose: Save all new weaves into a copy storage used if a player somehow loses their item without dropping it
#Runner: A player adding an element to a weave without a weave in their build slot
#Return values:
#Authors: Lprogrammer
################################################################################

#say new weave

scoreboard players add @s weave_count 1

execute store result storage magic:weave_copies_add_index player_id int 1 run scoreboard players get @s player_id
execute store result storage magic:weave_copies_add_index player_weave_index int 1 run scoreboard players get @s player_weave_index

function magic:weave_handling/weave_copies_add_index with storage magic:weave_copies_add_index

data remove storage magic:weave_copies_add_index player_id
data remove storage magic:weave_copies_add_index player_weave_index