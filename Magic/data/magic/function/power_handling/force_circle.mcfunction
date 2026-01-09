################################################################################
#Purpose: Force @s to circle with player with tag=force_circle_owner_temp 
#Doing the thing this way to keep an angreal present on the person being forced
#Runner: A player to be force circled
#Return values:
#Authors: Lprogrammer
################################################################################

tag @a[tag=force_circle_owner_temp] add create_circle_member_temp

execute as @a[tag=force_circle_owner_temp,tag=using,tag=can_use] run function magic:power_handling/exit

execute as @s[tag=!using,tag=can_use] run function magic:power_handling/open

#TODO handle if already in circle
function magic:power_handling/create_circle

tag @a[tag=force_circle_owner_temp] add to_be_circle_owner_temp
function magic:power_handling/pass_circle

tag @a remove force_circle_owner_temp
