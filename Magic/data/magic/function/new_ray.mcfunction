#The legacy will prevent the new method from running

#Bridge
execute as @s[scores={t_1=1,t_2=1,t_3=1,t_4=3,t_5=1,t_6=0}] run function magic:legacy_ray

#Throw
execute as @s[scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=1,t_6=0}] run function magic:legacy_ray

scoreboard players operation Ray_data reg_1 = @s player_id

scoreboard players operation Ray_data reg_4 = @s current_held
scoreboard players operation Ray_data reg_4 /= 10 reg_1
scoreboard players set Ray_data reg_2 1
scoreboard players set Ray_data reg_3 0

scoreboard players set @s click 0

#Bridge and throw will use the old snowball system
execute unless entity @e[tag=hit_ray] positioned ^ ^1 ^1 run function magic:ray_iteration

tag @e[tag=hit_ray] add hit_ray_done
tag @e[tag=hit_ray] remove hit_ray