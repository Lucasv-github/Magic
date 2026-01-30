execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 = @s current_drain
execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 *= 10 reg_1
execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 /= @s cumulative_halve_amount_hold