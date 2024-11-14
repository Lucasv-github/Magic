tag @s add current_circle_info

scoreboard players operation Temp reg_1 = @s player_id

execute as @a[tag=can_use, tag=circled] at @s if score @s circled_owner_id = Temp reg_1 run tellraw @a[tag=can_see,distance=..10] ["",{"selector":"@s","color":"gold"},{"text":" Circled: ","color":"gold"},{"selector":"@a[limit=1, tag=using, tag=can_use, tag=circle_owner, tag=current_circle_info]","color":"gold"}]

tag @s remove current_circle_info