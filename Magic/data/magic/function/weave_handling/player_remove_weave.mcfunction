################################################################################
#Purpose: Remove a weave denoted by $(index) whose weave item is present in a player's inventory
#Runner: A player with a weave in their inventory that should be removed
#Return values:
#Authors: Lprogrammer
################################################################################
$execute store success score @s reg_1 run clear @s minecraft:carrot_on_a_stick[custom_data~{Player_weave_index:$(index)}]
scoreboard players remove @s[scores={reg_1=1}] weave_count 1

$execute store result score Temp reg_1 run data get storage magic:weave_$(index) Elements
scoreboard players operation Temp reg_1 *= 10 reg_1
scoreboard players operation @s[scores={reg_1=1}] current_drain -= Temp reg_1

#This is for if when the weave isn't placed yet
$data modify storage magic:remove_weave_data index set value $(index)
function magic:cleanup/remove_weave_data with storage magic:remove_weave_data
data remove storage magic:remove_weave_data index

