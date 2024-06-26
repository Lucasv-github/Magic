scoreboard players operation Temp reg_1 = @s player_id

#If circled prevent more than x1
scoreboard players operation @s reg_2 = @s cumulative_halve_amount_hold
#scoreboard players operation @s reg_2 += @s cumulative_halve_amount_hold

#Limit max amount
scoreboard players set Give_force reg_1 0
execute if score @s current_held < @s reg_2 as @a[tag=can_use, tag=can_see, tag=circled, scores={regenerated_strength =1..}] if score @s circled_owner_id = Temp reg_1 at @s run scoreboard players add Give_force reg_1 10
execute if score @s current_held < @s reg_2 as @a[tag=can_use, tag=can_see, tag=circled, scores={regenerated_strength =1..}] if score @s circled_owner_id = Temp reg_1 run scoreboard players remove @s regenerated_strength 10
execute if score @s current_held < @s reg_2 run function magic:give_force_amount

#Workaround to not hold +up to ten too much and take damage
#Not really needed but will prevent flickering
execute if score @s current_held > @s reg_2 run scoreboard players operation @s current_held = @s reg_2




