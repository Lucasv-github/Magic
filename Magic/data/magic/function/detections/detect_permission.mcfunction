################################################################################
#Purpose: Check if the server is running with at least command permission level 3
#Runner: Any entity
#Return values: Temp reg_1 set to 1 if server is running with at least command permission level 3
#Authors: Lprogrammer
################################################################################

kick @a[tag=unobtainable_tag]
scoreboard players set Temp reg_1 1