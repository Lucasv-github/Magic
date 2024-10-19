#tellraw @a {"score":{"name":"@s","objective":"reg_1"}}

#reg_1 contains angreal leval
#reg_2 contains flawed

scoreboard players operation @s cumulative_halve_amount_hold = @s halve_amount_hold
scoreboard players operation @s cumulative_halve_amount_hold *= @s reg_1
scoreboard players operation @s regenerated_strength *= @s reg_1
scoreboard players operation @s angreal_level = @s reg_1

tag @s[scores={reg_2=1}] add angreal_flawed
tag @s add angrealed

execute at @s run playsound minecraft:block.anvil.place ambient @s

tag @s add current_player_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:debug/console_write_enter_angreal
tag @s remove current_player_for_log