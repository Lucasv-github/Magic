give @s minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Target","italic":false,"color":"dark_purple"}]',lore=['[{"text":"Force","italic":false}]'],custom_model_data=0,custom_data={Force:7}] 1

scoreboard players operation Temp reg_1 = @s player_id

#Damage player for every incorrect attached
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,tag=held_executed_once] if score @s player_id = Temp reg_1 as @a if score @s player_id = Temp reg_1 run damage @s 8 minecraft:magic
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,tag=held_executed_once] if score @s player_id = Temp reg_1 as @a if score @s player_id = Temp reg_1 run effect give @s nausea 5

#Remove bound stuff
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,tag=held_executed_once] if score @s player_id = Temp reg_1 at @s run scoreboard players set @e[distance=..2, scores={bound=1..}] bound 1

#Remove all held correctly
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used] if score @s player_id = Temp reg_1 run tag @s add temp_clear_correct
execute as @e[tag=temp_clear_correct] run function magic:remove_cleanup

#Not actie gets removed
execute as @e[tag=temp_clear_correct] on passengers run kill @s
kill @e[tag=temp_clear_correct]

#Remove flying snowballs
execute as @e[type=minecraft:snowball,tag=ray] if score @s player_id = Temp reg_1 on vehicle run kill @s
execute as @e[type=minecraft:snowball,tag=ray] if score @s player_id = Temp reg_1 run kill @s