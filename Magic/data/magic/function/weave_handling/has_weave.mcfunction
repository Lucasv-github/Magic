################################################################################
#Purpose: Check if a player has a weave specified by $(player_weave_index)
#Runner: A player who should be checked
#Return values: @s reg_1: weave_exists
#Authors: Lprogrammer
################################################################################
$execute store success score @s reg_1 run clear @s minecraft:carrot_on_a_stick[custom_data~{Player_weave_index:$(player_weave_index)}] 0
