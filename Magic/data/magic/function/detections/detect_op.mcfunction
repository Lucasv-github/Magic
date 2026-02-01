################################################################################
#Purpose: Detect if a player has op
#Runner: The players whose op status should be checked
#Return values: Temp reg_1 set to 1 if the player is opped
#Authors: Lprogrammer
################################################################################

execute store success score Temp reg_1 run deop @s[type=player]
execute if score Temp reg_1 matches 1 run tag @s add op_detected
op @s[type=player,tag=op_detected]