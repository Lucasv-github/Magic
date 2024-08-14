#Can't be stilled if using power, also need x3

scoreboard players operation Temp reg_1 = @s weave_execute_id
scoreboard players operation Temp reg_2 = @s player_id

scoreboard players set Temp reg_3 0
execute as @a if score @s player_id = Temp reg_2 run scoreboard players operation Temp reg_3 = @s cumulative_halve_amount_hold

execute as @a[tag=can_use,tag=!using] if score @s player_id = Temp reg_1 run tag @s add still_me

#Shouldn't be cumulative here as it might not be updated
scoreboard players operation @a[tag=still_me,limit=1] reg_1 = @s halve_amount_hold
scoreboard players operation @a[tag=still_me,limit=1] reg_1 += @s halve_amount_hold
scoreboard players operation @a[tag=still_me,limit=1] reg_1 += @s halve_amount_hold

execute if score @a[tag=still_me,limit=1] reg_1 > Temp reg_3 run tag @a remove still_me

execute as @a[tag=still_me,limit=1] run function magic:sever

tag @a remove still_me
