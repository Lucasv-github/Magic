#consume (((held*100)/cumulative_halve_amount_hold)*halve_amount_hold)/100
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 = @s current_held
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 *= 100 reg_1
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 /= @s cumulative_halve_amount_hold
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 *= @s halve_amount_hold
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 /= 100 reg_1
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s regenerated_strength -= @s reg_1

execute as @s[tag=using,tag=can_use,tag=tap_blocked] run function magic:exit
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=..0}] run function magic:exit
execute as @s[tag=using,tag=can_use,scores={shilded=1..}] run function magic:exit