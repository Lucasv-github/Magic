#Start furthest as the last will be used
execute at @s as @a[tag=can_use,tag=circled,sort=furthest,distance=..10] unless score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s player_id

execute as @a[tag=can_use] if score @s player_id = Temp reg_2 run tag @s add to_be_circle_owner_temp
function magic:power_handling/pass_circle