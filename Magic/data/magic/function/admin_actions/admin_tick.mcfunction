execute as @s[scores={magic_debug_state=1..}] run scoreboard players operation magic_settings magic_debug_state = @s magic_debug_state
scoreboard players set @s magic_debug_state 0

execute as @s[scores={magic_debug_weave_state=1..}] run scoreboard players operation magic_settings magic_debug_weave_state = @s magic_debug_weave_state
scoreboard players set @s magic_debug_weave_state 0

execute as @s[scores={magic_auto_ability_state=1..}] run scoreboard players operation magic_settings magic_auto_ability_state = @s magic_auto_ability_state
scoreboard players set @s magic_auto_ability_state 0

execute as @s[scores={magic_balefire_ban=1..}] run scoreboard players operation magic_settings magic_balefire_ban = @s magic_balefire_ban
scoreboard players set @s magic_balefire_ban 0

execute as @s[scores={give_book=1..}] run function magic:admin_actions/give_cheat_book
execute as @s[scores={remove_ability=1..}] run function magic:admin_actions/remove_ability
execute as @s[scores={re_add_ability=1..}] run function magic:admin_actions/re_add_ability
execute as @s[scores={add_ability=1..}] run function magic:admin_actions/add_ability
execute as @s[scores={admin_panel=1..}] run function magic:admin_actions/admin

scoreboard players enable @s select_player
scoreboard players enable @s magic_debug_state
scoreboard players enable @s magic_debug_weave_state
scoreboard players enable @s magic_auto_ability_state
scoreboard players enable @s magic_balefire_ban
scoreboard players enable @s set_halve_hold
scoreboard players enable @s set_regenerated