################################################################################
#Purpose: Mainly scale an entity's cumulative_halve_amount_hold based on the strength of the angreal they used
#Arguments: @s reg_1: angreal_leval @s reg_2: flawed
#Runner: An player who used an angreal
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation @s cumulative_halve_amount_hold = @s halve_amount_hold
scoreboard players operation @s cumulative_halve_amount_hold *= @s reg_1
#magic:power_handling/tap_power already does this so no reason to do this twice
#scoreboard players operation @s regenerated_strength *= @s reg_1
scoreboard players operation @s angreal_level = @s reg_1

tag @s[scores={reg_2=1}] add angreal_flawed
tag @s add angrealed

execute at @s run playsound minecraft:block.anvil.place ambient @s

tag @s add current_player_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:debug/console_write_enter_angreal
tag @s remove current_player_for_log