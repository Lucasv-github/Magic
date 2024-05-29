#consume (held*10+1)/cumulative_halve_amount_hold

execute as @a[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 = @s current_held
execute as @a[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 *= 10 reg_1
execute as @a[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players add @s reg_1 1
execute as @a[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 /= @s cumulative_halve_amount_hold
execute as @a[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s regenerated_strength -= @s reg_1