################################################################################
#Purpose: Consume strength, make sure power is still accessible if not exit, handle shielding and side effects when drawing too much power
#Consume (((held*100)/cumulative_halve_amount_hold)*halve_amount_hold)/100
#Runner: Any entity using magic, via events/second.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Prevent death
scoreboard players operation @s[tag=!circle_owner,tag=!angrealed] cumulative_halve_amount_hold = @s halve_amount_hold

#Consume (((held*100)/cumulative_halve_amount_hold)*halve_amount_hold)/100
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 = @s current_held
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 *= 100 reg_1
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 /= @s cumulative_halve_amount_hold
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 *= @s halve_amount_hold
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..}] run scoreboard players operation @s reg_1 /= 100 reg_1

#Regular consume
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=1..},tag=!welled] run scoreboard players operation @s regenerated_strength -= @s reg_1
execute as @s[tag=using,tag=can_use,tag=tap_blocked,tag=!welled] run function magic:power_handling/exit
execute as @s[tag=using,tag=can_use,scores={regenerated_strength=..0},tag=!welled] run function magic:power_handling/exit

#Welled consume
execute as @s[tag=using,tag=can_use,scores={well_amount=1..},tag=welled] run scoreboard players operation @s well_amount -= @s reg_1
execute as @s[tag=using,tag=can_use,tag=tap_blocked,tag=welled] run function magic:power_handling/exit
execute as @s[tag=using,tag=can_use,scores={well_amount=..0},tag=welled] run function magic:power_handling/exit

#Partial tap blocked decrease
scoreboard players operation @s[scores={tap_block_percentage=1..}] reg_1 = @s tap_block_percentage
scoreboard players operation @s[scores={tap_block_percentage=1..}] reg_1 *= @s current_held
scoreboard players operation @s[scores={tap_block_percentage=1..}] reg_1 /= 100 reg_1
scoreboard players operation @s[scores={tap_block_percentage=1..}] current_held -= @s reg_1

scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 /= 6 reg_1

#At 1/6:1: Night vision
#Weak resistace
execute if score @s current_held > @s reg_1 run effect give @s minecraft:night_vision 20 1 true
execute if score @s current_held > @s reg_1 run effect give @s minecraft:resistance 10 1 true

#Above 1:1 Damage
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
execute if score @s current_held > @s reg_1 run damage @s 1 minecraft:magic

#Above 2:1 More damage
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 *= 2 reg_1
execute if score @s current_held > @s reg_1 run damage @s 4 minecraft:magic


#Above 1:4 Invurnability+Lose ability
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 *= 4 reg_1
execute if score @s current_held > @s reg_1 run effect give @s minecraft:resistance 10 255 true
execute if score @s current_held > @s reg_1 run tag @s add next_sever

#Above 1:8 It is over
scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 *= 8 reg_1
execute if score @s current_held > @s reg_1 run scoreboard players operation @s doomed = @s current_held
execute if score @s current_held > @s reg_1 run function magic:power_handling/exit

#Shield handling
scoreboard players operation Temp reg_1 = @s entity_id
scoreboard players set Temp reg_2 0

function magic_commons:hooks/get_shielded_strength

scoreboard players operation Temp reg_2 = Temp reg_1
scoreboard players operation Temp reg_1 = @s entity_id

#TODO obviously allow opening with weak in the future
execute as @s[tag=opening,scores={regenerated_strength=1..}] unless score @s cumulative_halve_amount_hold = Temp reg_2 run tag @s add tap_power_shielded_temp

execute as @s[tag=!opening,scores={regenerated_strength=1..}] unless score @s cumulative_halve_amount_hold = Temp reg_2 run function magic:magic_actions/shield_handling

execute as @s[tag=tap_power_shielded_temp,tag=!welled] run function magic:magic_actions/held_overpower
execute as @s[tag=tap_power_shielded_temp,tag=!welled] run function magic:power_handling/exit

execute as @s[tag=tap_power_shielded_temp,scores={sneak_time=..20,regenerated_strength=1..}] run function magic:magic_actions/tied_shield_unknot
execute as @s[tag=tap_power_shielded_temp,scores={sneak_time=..100,regenerated_strength=1..}] run function magic:display/display_shields
execute as @s[tag=tap_power_shielded_temp,scores={sneak_time=100..,regenerated_strength=1..}] run function magic:display/display_shields_change

tag @s remove tap_power_shielded_temp
