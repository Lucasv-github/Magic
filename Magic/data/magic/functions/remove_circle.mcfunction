tag @s remove circle_owner

scoreboard players operation Temp reg_1 = @s player_id

#Clear
execute as @a[tag=can_use] if score @s circled_owner_id = Temp reg_1 run tag @s remove circled
execute as @a[tag=can_use] if score @s circled_owner_id = Temp reg_1 run scoreboard players reset @s circled_owner_id

clear @s lead