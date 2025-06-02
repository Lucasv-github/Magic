#This function is to be executed by the circle owner

#Get positive/negative distance from 32
execute store result score @s reg_1 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:9}] 0

#Need old copy
scoreboard players operation @s reg_2 = @s reg_1

scoreboard players remove @s[scores={reg_2=32..}] reg_1 32
scoreboard players remove @s[scores={reg_2=..31}] reg_1 32

scoreboard players operation Temp reg_1 = @s player_id
execute as @a[tag=circled,tag=can_use,scores={regenerated_strength=1..}] if score @s circled_owner_id = Temp reg_1 run tag @s add periodic_draw_circle_temp

scoreboard players operation Temp reg_1 = @s current_held
execute as @e[tag=periodic_draw_circle_temp] run scoreboard players operation @s my_draw_amount -= Temp reg_1

scoreboard players operation @s total_draw_amount -= Temp reg_1
#scoreboard players operation @s my_draw_amount -= Temp reg_1

#Increase/decreases
scoreboard players operation Draw_force reg_1 = @s reg_1
function magic:power_handling/draw_multiple

scoreboard players operation Temp reg_1 = @s current_held
execute as @e[tag=periodic_draw_circle_temp] run scoreboard players operation @s my_draw_amount += Temp reg_1

scoreboard players operation @s total_draw_amount += Temp reg_1
#scoreboard players operation @s my_draw_amount += Temp reg_1

tag @e remove periodic_draw_circle_temp