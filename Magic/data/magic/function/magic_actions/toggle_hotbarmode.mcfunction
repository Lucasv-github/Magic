################################################################################
#Purpose: Switch between the 3 hotbarmodes: Items, Auto, Empty
#Runner: A player switching hotbarmodes
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players add @s use_items 1
execute as @s[scores={use_items=3..}] run scoreboard players set @s use_items 0
