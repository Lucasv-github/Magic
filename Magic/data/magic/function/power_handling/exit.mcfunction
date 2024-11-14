tag @s add current_player_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:debug/console_write_exit
tag @s remove current_player_for_log

execute as @s[tag=circle_owner] run function magic:power_handling/remove_circle
execute as @s[tag=angrealed] run function magic:power_handling/remove_angreal

tag @s remove using
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

effect clear @s minecraft:night_vision

#Damage player for every incorrect attached
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,tag=held_executed_once] if score @s player_id = Temp reg_1 as @a if score @s player_id = Temp reg_1 run damage @s 8 minecraft:magic
execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,tag=held_executed_once] if score @s player_id = Temp reg_1 as @a if score @s player_id = Temp reg_1 run effect give @s nausea 5
