tag @s add managed_to_break_free

execute as @e[type=armor_stand,tag=target_point, tag=tied_off, scores={t_1=5,t_2=5,t_3=5,t_4=0}] if score @s weave_execute_id = @a[tag=managed_to_break_free, limit=1] player_id run tag @s add break_posible_fail
execute as @e[type=armor_stand,tag=target_point,tag=tied_off, scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0}] if score @s weave_execute_id = @a[tag=managed_to_break_free, limit=1] player_id run tag @s add break_posible_fail

#TODO change based on strenght (halve_hold)
scoreboard players set @e[limit=1,sort=random, tag=break_posible_fail] weave_remaining_time 0

tag @e remove break_posible_fail
tag @s remove can_break_free
tag @a remove managed_to_break_free

scoreboard players set @s click_counter 0
tag @s remove can_break_free
execute at @s run playsound minecraft:block.comparator.click ambient @s