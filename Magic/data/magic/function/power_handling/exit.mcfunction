################################################################################
#Purpose: Remove magic interaction items, held weaves, handle angreal/well exits and give back original hotbar items
#Runner: An entity exiting the power
#Return values:
#Authors: Lprogrammer
################################################################################


tag @s add current_player_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:debug/console_write_exit
tag @s remove current_player_for_log

execute as @s[tag=circle_owner] run function magic:power_handling/remove_circle
execute as @s[tag=angrealed] run function magic:power_handling/remove_angreal

tag @s remove using
tag @s remove built
scoreboard players set @s current_held 0

scoreboard players operation Temp reg_1 = @s player_id

function magic:cleanup/remove_cleanup_player_all

function magic:inventory/clear_magic_items
clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:6}]

function magic:inventory/load_hotbar

#Needs to be after hotbar load
execute as @s[tag=welled] run function magic:power_handling/remove_well

effect clear @s minecraft:night_vision

#Not same sever side effects here, thus doing manually
execute as @s[tag=next_sever] run tag @s remove can_use
execute as @s[tag=next_sever] run tag @s add stilled
tag @s[tag=next_sever] remove next_sever

#Reset halve hold
scoreboard players operation @s cumulative_halve_amount_hold = @s halve_amount_hold
