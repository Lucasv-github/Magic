################################################################################
#Purpose: Remove a weave denoted by $(index) whose weave item is present in a player's inventory
#Runner: A player with a weave in their inventory that should be removed
#Return values:
#Authors: Lprogrammer
################################################################################
$clear @s minecraft:carrot_on_a_stick[custom_data~{Player_weave_index:$(index)}]

#This is for if when the weave isn't placed yet
$data modify storage magic:remove_weave_data index set value $(index)
function magic:cleanup/remove_weave_data with storage magic:remove_weave_data

