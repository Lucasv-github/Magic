################################################################################
#Purpose: Add to circle owner current_draw based on @s reg_1 and adjust strengths
#Runner: A member of a circle, run via power_handling/periodic_draw_circle.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################
scoreboard players operation Temp reg_1 = @e[limit=1,tag=circle_owner_temp] cumulative_halve_amount_hold
scoreboard players operation Temp reg_1 -= @e[limit=1,tag=circle_owner_temp] current_draw

#Bail if already maxed
execute if score Temp reg_1 matches ..0 run return 0

#Limit to diff if above
execute if score @s reg_1 > Temp reg_1 run scoreboard players operation @s reg_1 = Temp reg_1

#Add to owner total amount
scoreboard players operation @e[limit=1,tag=circle_owner_temp] total_draw_amount += @s reg_1

#Add to member amount
scoreboard players operation @s my_draw_amount += @s reg_1

scoreboard players operation @e[limit=1,tag=circle_owner_temp] current_draw += @s reg_1
