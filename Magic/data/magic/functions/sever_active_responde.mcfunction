execute as @s[tag=using, tag=can_use, scores={sever_active_time=2..}] run scoreboard players operation Remove_force reg_1 = @s sever_active_amount

execute as @s[tag=using, tag=can_use, scores={sever_active_time=2..}] run function magic:remove_force_amount

#Shouldn't matter
execute as @s[tag=using, tag=can_use, scores={sever_active_time=2..}] run scoreboard players set @s sever_active_amount 0

#Need to be furthest down
execute as @s[tag=using, tag=can_use, scores={sever_active_time=2..}] run scoreboard players set @s sever_active_time 0

scoreboard players set @s state 0