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

scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 /= 2 reg_1

#At 1/2:1: Night vision
#Weak resistace
execute if score @s current_held >= @s reg_1 run effect give @s minecraft:night_vision 20 1 true
execute if score @s current_held >= @s reg_1 run effect give @s minecraft:resistance 10 1 true

#At 1:1 Damage
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
execute if score @s current_held >= @s reg_1 run damage @s 1 minecraft:magic

#At 2:1 More damage
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 *= 2 reg_1
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
execute if score @s current_held >= @s reg_1 run damage @s 4 minecraft:magic


#At 1:4 Invurnability+Lose ability
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 *= 4 reg_1
execute if score @s current_held >= @s reg_1 run effect give @s minecraft:resistance 10 255 true
execute if score @s current_held >= @s reg_1 run tag @s add next_sever

#At 1:8 It is over
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 *= 8 reg_1
execute if score @s current_held >= @s reg_1 run scoreboard players operation @s doomed = @s current_held
execute if score @s current_held >= @s reg_1 run function magic:exit
 

