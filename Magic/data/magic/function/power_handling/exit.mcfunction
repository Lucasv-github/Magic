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

#Mark bridges made on this run(tied off), can't be destroyed by grabbing power again
execute as @e[type=minecraft:armor_stand, tag=destroy_bridge] if score Temp reg_1 = @s player_id run tag @s add previous_bridge

#Remove bridge builder
execute as @e[tag=build_bridge] if score @s player_id = Temp reg_1 run kill @s

function magic:magic_support/clear_magic_items
clear @s minecraft:ender_eye[custom_data~{Magic:6}]

#function magic:drop_current_hotbar

function magic:inventory/load_hotbar

#Needs to be after hotbar load
execute as @s[tag=welled] run function magic:power_handling/remove_well

effect clear @s minecraft:night_vision

execute as @s[tag=next_sever] run function magic:power_handling/remove_ability
tag @s[tag=next_sever] remove next_sever

#Reset halve hold
scoreboard players operation @s cumulative_halve_amount_hold = @s halve_amount_hold
