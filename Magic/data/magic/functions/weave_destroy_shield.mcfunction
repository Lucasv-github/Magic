scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s current_held
scoreboard players operation Temp reg_2 /= 3 reg_1

execute as @e[tag=target_point,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0,weave_remaining_time=1..}] if score @s current_held < Temp reg_2 run tag @s add destroy_weave
execute as @e[tag=target_point,scores={t_1=5,t_2=5,t_3=5,t_4=0,weave_remaining_time=1..}] if score @s current_held < Temp reg_2 run tag @s add destroy_weave
execute as @e[tag=target_point,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=5,t_7=5,t_8=5,t_9=5,t_10=5,t_11=5,t_12=5,t_13=5,t_14=5,t_15=0,weave_remaining_time=1..}] if score @s current_held < Temp reg_2 run tag @s add destroy_weave

execute as @e[tag=target_point,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0},tag=actively_held] if score @s current_held < Temp reg_2 run tag @s add destroy_weave
execute as @e[tag=target_point,scores={t_1=5,t_2=5,t_3=5,t_4=0},tag=actively_held] if score @s current_held < Temp reg_2 run tag @s add destroy_weave
execute as @e[tag=target_point,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=5,t_6=5,t_7=5,t_8=5,t_9=5,t_10=5,t_11=5,t_12=5,t_13=5,t_14=5,t_15=0},tag=actively_held] if score @s current_held < Temp reg_2 run tag @s add destroy_weave

#All the regs will be messed up during this
execute as @e[tag=destroy_weave] run function magic:destroy_shield_iteration