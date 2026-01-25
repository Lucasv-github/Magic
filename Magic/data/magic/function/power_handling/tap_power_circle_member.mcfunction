################################################################################
#Purpose: Consume strength from circle members based on how much was drawn from them
#Consume: (((100*my_draw_amount)/owner_total_draw_amount)*owner_draw)/100
#Runner: A player that is a member of a circle
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s circled_owner_id
execute as @a[tag=can_use,tag=using,tag=circle_owner] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s total_draw_amount
execute as @a[tag=can_use,tag=using,tag=circle_owner] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_3 = @s current_draw

#Consume: (((100*my_draw_amount)/owner_total_draw_amount)*owner_draw)/100
scoreboard players operation @s reg_1 = @s my_draw_amount
scoreboard players operation @s reg_1 *= 100 reg_1
scoreboard players operation @s reg_1 /= Temp reg_2
scoreboard players operation @s reg_1 *= Temp reg_3
scoreboard players operation @s reg_1 /= 100 reg_1

#If below zero we will stop in /function/periodic_draw_circle.mcfunction
scoreboard players operation @s[scores={regenerated_strength=1..}] regenerated_strength -= @s reg_1
