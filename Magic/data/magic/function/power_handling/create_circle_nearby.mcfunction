execute at @s run tag @a[distance=1..10,scores={sneak_time=100..},limit=1,sort=nearest] add create_circle_member_temp

execute as @s[scores={sneak_time=100..},tag=using,tag=!circle_owner,tag=!circled] run function magic:power_handling/create_circle

#Fallback if magic:power_handling/create_circle is not called
tag @a remove create_circle_member_temp