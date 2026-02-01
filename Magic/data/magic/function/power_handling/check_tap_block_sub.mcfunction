################################################################################
#Purpose: Check if an entity denoted by tag=check_tap_block_temp are within any tap blocks with a radius of $(radius)
#Runner: Any entity that is a tap block, run via power_handling/check_tap_block.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Still executing at tapping entity
$execute if entity @s[distance=..$(radius)] run tag @e[tag=check_tap_block_temp] add tap_blocked