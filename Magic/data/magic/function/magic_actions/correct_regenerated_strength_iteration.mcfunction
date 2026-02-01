################################################################################
#Purpose: Loop until Correct_regenerate_strength reg_1 reaches 0 and refill strength of the player to max/20 on each iteration
#Runner: The player whose strength should be refilled, run via magic:magic_actions/correct_regenerated_strength or magic:magic_actions/correct_regenerated_strength_iteration
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players remove Correct_regenerate_strength reg_1 1

function magic:magic_actions/regenerate_strength_once

execute if score Correct_regenerate_strength reg_1 matches 1..19 run function magic:magic_actions/correct_regenerated_strength_iteration
