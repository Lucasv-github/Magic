################################################################################
#Purpose: Join @s to an already existing circle within the range of 10 blocks
#Runner: A player joining a circle
#Return values:
#Authors: Lprogrammer
################################################################################

execute at @s run tag @a[distance=..10,limit=1,sort=nearest,tag=can_use,tag=using,tag=circle_owner] add circle_owner_temp
function magic:power_handling/enter_circle