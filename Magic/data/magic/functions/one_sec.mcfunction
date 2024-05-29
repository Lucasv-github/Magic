execute as @a[tag=can_use, tag=using] unless entity @s[nbt={SelectedItem:{id:"minecraft:ender_eye"}}] run function magic:periodic_draw

execute as @e[tag=target_point,tag=tied_off,scores={weave_remaining_time=1..}] at @s run function magic:display_composition_calculate_distance
execute as @e[tag=target_point,tag=gateway_end,scores={weave_remaining_time=1..}] at @s run function magic:display_composition_calculate_distance
execute as @e[tag=target_point,tag=actively_held] at @s run function magic:display_composition_calculate_distance

execute as @e[tag=target_point,tag=tied_off,scores={weave_remaining_time=0}] run function magic:remove_cleanup

scoreboard players remove @a[scores={shields_blocked=1..}] shields_blocked 1
scoreboard players remove @a[scores={disguise=1..}] disguise 1
scoreboard players remove @a[scores={invert=1..}] invert 1
scoreboard players remove @e[scores={bound=1..}] bound 1
scoreboard players remove @e[scores={finder_time=1..}] finder_time 1
scoreboard players remove @e[scores={projectile_shielded=1..}] projectile_shielded 1


scoreboard players remove @e[scores={shield_active_time=1..}] shield_active_time 1
scoreboard players remove @e[scores={sever_active_time=1..}] sever_active_time 1

scoreboard players remove @a[scores={shilded=1..}] shilded 1
scoreboard players remove @a[scores={progressive_shielded =1..}] progressive_shielded 1

scoreboard players remove @e[tag=destroy, scores={bridge=1..}] bridge 1
execute as @e[tag=destroy, scores={bridge=0}] run function magic:remove_bridge

scoreboard players remove @e[type=minecraft:armor_stand,tag=target_point, scores={weave_remaining_time=1..},tag=!actively_held] weave_remaining_time 1

#Not active signifies that it is still held
scoreboard players remove @e[type=minecraft:armor_stand,tag=target_point, scores={weave_despawn_time=1..},tag=!actively_held] weave_despawn_time 1

#Wards
execute at @e[scores={t_1=5,t_2=1,t_3=5,t_4=1,t_5=5,t_6=0}] if entity @a[distance=..5] run function magic:ward_player_detected
execute at @e[scores={t_1=5,t_2=1,t_3=2,t_4=1,t_5=5,t_6=0}] if entity @e[distance=..5,type=!player,tag=!target_point,type=!item] run function magic:ward_entity_detected


execute as @a[tag=using,tag=can_use] run function magic:tap_power

scoreboard players add Temp second_counter 1

execute if score Temp second_counter matches 6 run function magic:five_sec
execute if score Temp second_counter matches 11 run function magic:five_sec
execute if score Temp second_counter matches 16 run function magic:five_sec
execute if score Temp second_counter matches 21 run function magic:five_sec
execute if score Temp second_counter matches 26 run function magic:five_sec
execute if score Temp second_counter matches 31 run function magic:five_sec
execute if score Temp second_counter matches 36 run function magic:five_sec
execute if score Temp second_counter matches 41 run function magic:five_sec
execute if score Temp second_counter matches 46 run function magic:five_sec
execute if score Temp second_counter matches 51 run function magic:five_sec
execute if score Temp second_counter matches 56 run function magic:five_sec
execute if score Temp second_counter matches 61 run function magic:five_sec

execute if score Temp second_counter matches 11 run function magic:ten_sec
execute if score Temp second_counter matches 21 run function magic:ten_sec
execute if score Temp second_counter matches 31 run function magic:ten_sec
execute if score Temp second_counter matches 41 run function magic:ten_sec
execute if score Temp second_counter matches 51 run function magic:ten_sec
execute if score Temp second_counter matches 61 run function magic:ten_sec

execute if score Temp second_counter matches 61.. run function magic:minute
execute if score Temp second_counter matches 61.. run scoreboard players set Temp second_counter 0