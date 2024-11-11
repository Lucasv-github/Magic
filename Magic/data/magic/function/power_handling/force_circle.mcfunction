#Entity with tag force_circle_owner_temp becomes owner, @s becomes forced to circle

#Doing the thing this way to keep an angreal present on the person being forced

tag @a[tag=force_circle_owner_temp] add create_circle_member_temp

execute as @a[tag=force_circle_owner_temp,tag=using,tag=can_use] run function magic:power_handling/exit

execute as @s[tag=!using,tag=can_use] run function magic:power_handling/open

#TODO handle if already in circle
function magic:power_handling/create_circle

tag @a[tag=force_circle_owner_temp] add to_be_circle_owner_temp
function magic:power_handling/pass_circle

tag @a remove force_circle_owner_temp
