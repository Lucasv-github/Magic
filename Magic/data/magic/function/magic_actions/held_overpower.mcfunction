say held owerpower

execute store result storage magic:stun stun_amount int 1 run scoreboard players get 1 reg_1
function magic:magic_actions/stun with storage magic:stun

scoreboard players operation Temp reg_1 = @s entity_id
scoreboard players set Temp reg_2 0

execute at @s as @e[tag=weave_shield,tag=target_point,tag=actively_held,sort=nearest] if score @s weave_locked_entity_id = Temp reg_1 run tag @s add held_overpower_temp
execute at @s as @e[tag=weave_shield,tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},sort=nearest] if score @s weave_locked_entity_id = Temp reg_1 run tag @s add held_overpower_temp

execute as @e[tag=held_overpower_temp] run scoreboard players operation Temp reg_2 += @s cumulative_halve_amount_hold

scoreboard players operation Temp reg_2 += @s cumulative_halve_amount_hold

#Self effect (own_halve, should not be cumulative to prevent angreal making it easier) 
scoreboard players operation Temp reg_1 = @s halve_amount_hold
scoreboard players operation @s regenerated_strength -= Temp reg_1


scoreboard players operation Temp reg_1 = @s halve_amount_hold


#Oponent effect ((own_halve/3)/opponents_halve)/opponents = ((own_halve/3)*(own_halve/3))/opponents
scoreboard players operation Temp reg_1 = @s halve_amount_hold
scoreboard players operation Temp reg_1 /= 3 reg_1
scoreboard players operation Temp reg_1 *= Temp reg_1
scoreboard players operation Temp reg_1 /= Temp reg_2

scoreboard players operation Temp reg_2 = Temp reg_1

execute as @e[tag=held_overpower_temp] run function magic:magic_actions/held_overpower_iteration

tag @e remove held_overpower_temp






