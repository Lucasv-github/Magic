################################################################################
#Purpose: Remove any weaves from a player that weren't created this session
#Runner: A  player whose weaves should be removed
#Return values:
#Authors: Lprogrammer
################################################################################
execute store result storage magic:remove_illegal_weave session int 1 run scoreboard players get @s magic_session

function magic:inventory/remove_illegal_weave_sub with storage magic:remove_illegal_weave