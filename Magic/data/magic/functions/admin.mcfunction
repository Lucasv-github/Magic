tag @s add magic_admin

tellraw @s {"text":"----------------------------------------","color":"gold"}
tellraw @s ["",{"text":"Debug:      ","color":"gold"},{"text":"✔","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_debug_state set 2"}}," ",{"text":"X","bold":true,"color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger magic_debug_state set 1"}}]
tellraw @s ["",{"text":"Remove ability: ","color":"gold"},{"text":"X","bold":true,"color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger magic_remove_ability set 1"}}]
tellraw @s ["",{"text":"Re-add ability: ","color":"gold"},{"text":"✔","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_re_add_ability set 1"}}]
tellraw @s ["",{"text":"Add ability: ","color":"gold"},{"text":"✔","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_add_ability set 1"}}]
tellraw @s ["",{"text":"Give cheat book: ","color":"gold"},{"text":"✔","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_give_book set 1"}}]
tellraw @s {"text":"----------------------------------------","color":"gold"}

scoreboard players set @s magic_admin 0

scoreboard players enable @s[tag=magic_admin] magic_admin
scoreboard players enable @s[tag=magic_admin] select_player
scoreboard players enable @s[tag=magic_admin] magic_debug_state
scoreboard players enable @s[tag=magic_admin] magic_remove_ability
scoreboard players enable @s[tag=magic_admin] magic_re_add_ability
scoreboard players enable @s[tag=magic_admin] magic_give_book
scoreboard players enable @s[tag=magic_admin] magic_add_ability
scoreboard players enable @s[tag=magic_admin] set_halve_hold
scoreboard players enable @s[tag=magic_admin] set_regenerated