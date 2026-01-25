################################################################################
#Purpose: Increase held power in owner based on power adjustor and amount of people in the circle
#Runner: Any owner of a circle, not holding their circle power adjustor, run via events/second.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s player_id
execute as @a[tag=circled,tag=can_use,scores={regenerated_strength=1..}] if score @s circled_owner_id = Temp reg_1 run tag @s add periodic_draw_circle_temp

execute store result score Temp reg_1 run clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:9}] 0

scoreboard players operation @e[tag=periodic_draw_circle_temp] reg_1 = Temp reg_1
execute as @e[tag=periodic_draw_circle_temp] run function magic:power_handling/calculate_draw
#execute as @e[tag=periodic_draw_circle_temp] run tellraw @a {score:{name:"@s",objective:"reg_1"},color:"dark_red"}

tag @s add circle_owner_temp

execute as @e[tag=periodic_draw_circle_temp] run function magic:power_handling/circle_owner_draw_add

tag @s remove circle_owner_temp

tag @e remove periodic_draw_circle_temp
