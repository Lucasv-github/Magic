################################################################################
#Purpose: Try to create a circle with @s as the owner and A (ONE) nearby player with enough sneak time as A (ONE) member
#I am not sure if the ONE is a limitation but I dare not touch this at this point
#
#Runner:
#Return values:
#Authors: Lprogrammer
################################################################################

execute at @s run tag @a[distance=1..10,scores={sneak_time=100..},limit=1,sort=nearest] add create_circle_member_temp

execute as @s[scores={sneak_time=100..},tag=using,tag=!circle_owner,tag=!circled] run function magic:power_handling/create_circle

#Fallback if magic:power_handling/create_circle is not called
tag @a remove create_circle_member_temp