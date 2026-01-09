################################################################################
#Purpose: Halve the tied strength of a tied shield weave if the tied strength was guessed correctly by the shielded player and finally destroy weave if reaches zero
#Runner: A player using magic, via power_handling/tap_power.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s player_id

execute at @s as @e[tag=weave_shield,tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},sort=nearest] if score @s weave_locked_player_id = Temp reg_1 run tag @s add tied_shield_unknot_temp

scoreboard players operation Temp reg_1 = @s tie_strength

tag @s add tied_shield_unknot_tell_temp

execute as @e[tag=tied_shield_unknot_temp,tag=shield_counter_selected] if score @s tie_strength = Temp reg_1 as @a[tag=tied_shield_unknot_tell_temp] at @s run playsound minecraft:block.tripwire.detach ambient @s
execute as @e[tag=tied_shield_unknot_temp,tag=shield_counter_selected] if score @s tie_strength = Temp reg_1 run scoreboard players operation @s tie_strength /= 2 reg_1
execute as @e[tag=tied_shield_unknot_temp,tag=shield_counter_selected] if score @s tie_strength matches 0 as @a[tag=tied_shield_unknot_tell_temp] at @s run playsound minecraft:block.barrel.open ambient @s
execute as @e[tag=tied_shield_unknot_temp,tag=shield_counter_selected] if score @s tie_strength matches 0 run function magic:cleanup/remove_cleanup

tag @s remove tied_shield_unknot_tell_temp
tag @e remove tied_shield_unknot_temp


