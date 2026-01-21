################################################################################
#Purpose: Send @s's tap_block_range into magic:power_handling/check_tap_block_sub
#Runner: Any entity that is a tap blocker, which has a set tap_block_range
#Return values:
#Authors: Lprogrammer
################################################################################

execute store result storage magic:check_tap_block_sub radius int 1 run scoreboard players get @s tap_block_range
function magic:power_handling/check_tap_block_sub with storage magic:check_tap_block_sub

data remove storage magic:check_tap_block_sub radius