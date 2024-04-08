scoreboard players operation Temp reg_1 = @s player_id
scoreboard players set Temp reg_2 0

#Start furthest as the last will be used
execute at @s as @a[tag=can_use,tag=circled,sort=furthest,distance=..10] unless score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s player_id

execute as @a[tag=can_use] if score @s player_id = Temp reg_2 run tag @s add to_be_circle_owner

execute as @a[tag=to_be_circle_owner] run function magic:open
scoreboard players operation @a[tag=to_be_circle_owner] cumulative_halve_amount_hold = @s cumulative_halve_amount_hold
scoreboard players operation @a[tag=to_be_circle_owner] current_held = @s current_held
tag @a[tag=to_be_circle_owner] remove circled
tag @a[tag=to_be_circle_owner] add circle_owner
tag @a[tag=to_be_circle_owner] remove to_be_circle_owner

execute as @s run function magic:exit
tag @s remove circle_owner
tag @s add circled