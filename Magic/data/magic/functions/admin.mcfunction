tag @s add admin

tellraw @s {"text":"----------------------------------------","color":"gold"}
tellraw @s ["",{"text":"Debug:      ","color":"gold"},{"text":"✔","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_debug_state set 2"}}," ",{"text":"X","bold":true,"color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger magic_debug_state set 1"}}]
tellraw @s ["",{"text":"Remove ability: ","color":"gold"},{"text":"X","bold":true,"color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger remove_ability set 1"}}]
tellraw @s ["",{"text":"Re-add ability: ","color":"gold"},{"text":"✔","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger re_add_ability set 1"}}]
tellraw @s ["",{"text":"Add ability: ","color":"gold"},{"text":"✔","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger add_ability set 1"}}]
tellraw @s ["",{"text":"Give cheat book: ","color":"gold"},{"text":"✔","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger give_book set 1"}}]
tellraw @s {"text":"----------------------------------------","color":"gold"}

scoreboard players set @s admin_panel 0

scoreboard players enable @s[tag=admin] admin_panel
scoreboard players enable @s[tag=admin] select_player
scoreboard players enable @s[tag=admin] magic_debug_state
scoreboard players enable @s[tag=admin] remove_ability
scoreboard players enable @s[tag=admin] re_add_ability
scoreboard players enable @s[tag=admin] give_book
scoreboard players enable @s[tag=admin] add_ability
scoreboard players enable @s[tag=admin] set_halve_hold
scoreboard players enable @s[tag=admin] set_regenerated