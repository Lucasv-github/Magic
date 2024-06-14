scoreboard players operation Temp reg_1 = @s player_id

scoreboard players set Temp reg_2 0
execute as @a[tag=circled] if score @s circled_owner_id = Temp reg_1 run scoreboard players set Temp reg_2 1

execute if score Temp reg_2 matches 0 run function magic:exit