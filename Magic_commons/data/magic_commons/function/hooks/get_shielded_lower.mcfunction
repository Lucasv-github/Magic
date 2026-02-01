scoreboard players set Temp reg_2 0

execute as @e[type=armor_stand,tag=target_point,tag=actively_held,tag=shield_locked] if score @s weave_locked_entity_id = Temp reg_1 run scoreboard players operation Temp reg_2 += @s shield_lower_amount
execute as @e[type=armor_stand,tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},tag=shield_locked] if score @s weave_locked_entity_id = Temp reg_1 run scoreboard players operation Temp reg_2 += @s shield_lower_amount

scoreboard players operation Temp reg_1 = Temp reg_2

