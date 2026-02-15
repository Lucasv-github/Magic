execute as @s[tag=circled] run function magic:power_handling/exit
tag @s[tag=circled] remove can_use
tag @s[tag=circled] remove can_see
kill @s[tag=circled]
################################################################################
#Purpose: Gets run every time a player joins the server
#Runner: The player that joined the server, via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

tag @s[tag=circled] remove circled
scoreboard players set @s leave_detect 0

function magic:detections/detect_op
tag @s[tag=op_detected] add admin
tellraw @s[tag=op_detected] {"text":"Welcome admin!","bold":true,"color":"gold"}
tellraw @s[tag=!op_detected,tag=admin] {"text":"Welcome admin!","bold":true,"color":"gold"}
tag @s[tag=op_detected] remove op_detected

#Enable
scoreboard players enable @s[tag=admin] admin_panel
scoreboard players enable @s[tag=admin] remove_ability
scoreboard players enable @s[tag=admin] re_add_ability
scoreboard players enable @s[tag=admin] give_book
scoreboard players enable @s[tag=admin] add_ability

scoreboard players enable @a[tag=admin] select_player
scoreboard players enable @a[tag=admin] magic_debug_state
scoreboard players enable @a[tag=admin] set_halve_hold
scoreboard players enable @a[tag=admin] set_regenerated
scoreboard players enable @s[tag=admin] magic_balefire_ban
scoreboard players enable @s[tag=admin] magic_auto_ability_state

execute unless score @s use_items matches -2147483647.. run scoreboard players set @s use_items 1
execute unless score @s use_items_current matches -2147483647.. run scoreboard players set @s use_items_current 1

function magic:magic_actions/correct_regenerated_strength