execute as @s[tag=circled] run function magic:exit
tag @s[tag=circled] remove can_use
tag @s[tag=circled] remove can_see
kill @s[tag=circled]
tag @s[tag=circled] remove circled
scoreboard players set @s leave_detect 0

function magic:detect_op
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

#Reset all these so math works
scoreboard players add @s regenerated_strenght 0

#Level should be one normaly
scoreboard players add @s angreal_level 0
execute as @s if score @s angreal_level matches 0 run scoreboard players set @s angreal_level 1

scoreboard players add @s t_1 0
scoreboard players add @s t_2 0
scoreboard players add @s t_3 0
scoreboard players add @s t_4 0
scoreboard players add @s t_5 0
scoreboard players add @s t_6 0
scoreboard players add @s t_7 0
scoreboard players add @s t_8 0
scoreboard players add @s t_9 0
scoreboard players add @s t_10 0
scoreboard players add @s t_11 0
scoreboard players add @s t_12 0
scoreboard players add @s t_13 0
scoreboard players add @s t_14 0
scoreboard players add @s t_15 0
scoreboard players add @s t_16 0
scoreboard players add @s t_17 0
scoreboard players add @s t_18 0
scoreboard players add @s t_19 0
scoreboard players add @s t_20 0

scoreboard players add @s stage 0

scoreboard players add @s invert 0
scoreboard players add @s disguise 0
scoreboard players add @s shilded 0
scoreboard players add @s progressive_shielded 0

execute unless score @s use_items matches -2147483647.. run scoreboard players set @s use_items 1

execute as @s[tag=!joined_before] if score magic_settings magic_auto_ability_state matches 2 run function magic:auto_add_ability

tag @s add joined_before