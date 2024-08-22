#From person responding
execute as @s[tag=using, tag=can_use, scores={shield_active_time=2..}] run scoreboard players operation Remove_force reg_1 = @s shield_active_amount
execute as @s[tag=using, tag=can_use, scores={shield_active_time=2..}] run function magic:remove_force_amount

#From person attacking
execute as @s[tag=using, tag=can_use, scores={shield_active_time=2..}] run scoreboard players operation Remove_force reg_1 = @s shield_active_amount

#Invalid id if we somehow don't find anything
scoreboard players set Temp reg_2 0
scoreboard players operation Temp reg_1 = @s player_id
execute as @e[tag=target_point,tag=actively_held] if score @s weave_locked_player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s player_id

#This won't touch reg_2 which could be problematic if it did
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run function magic:stun
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run clear @s ender_eye[custom_data={Magic:9}] 6
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_2 run function magic:remove_force_amount

#Shouldn't matter
execute as @s[tag=using, tag=can_use, scores={shield_active_time=2..}] run scoreboard players set @s shield_active_amount 0

#Need to be furthest down
execute as @s[tag=using, tag=can_use, scores={shield_active_time=2..}] run scoreboard players set @s shield_active_time 0

scoreboard players set @s state 0