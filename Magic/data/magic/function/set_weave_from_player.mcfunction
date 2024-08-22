#say set weave from player

scoreboard players operation Temp reg_1 = @s player_id

execute as @a if score @s player_id = Temp reg_1 if score @s t_1 matches 1.. run tag @s add set_weave_from_my_score
execute as @a if score @s player_id = Temp reg_1 if data entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index run tag @s add set_weave_from_my_hand

#Can get a weave later but available right now
execute unless entity @a[tag=set_weave_from_my_score] unless entity @a[tag=set_weave_from_my_hand] run tag @s add no_weave

execute as @s[tag=!no_weave] run function magic:pre_weaves

tag @a remove set_weave_from_my_score
tag @a remove set_weave_from_my_hand