################################################################################
#Purpose: Display info about one specific shield denoted by to @s a player denoted by tag=display_shelds_tell_temp
#Runner: The armorstand holding the shield weave to be displayed, run via display/display_shields.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute as @s[tag=actively_held,tag=!shield_counter_selected] run tellraw @a[tag=display_shelds_tell_temp] {"text":"~","bold":true,"color":"gold"}
execute as @s[tag=actively_held,tag=shield_counter_selected] run tellraw @a[tag=display_shelds_tell_temp] ["",{"text":"~","bold":true,"color":"gold"},{"text":"<","bold":true,"color":"dark_red"}]


execute as @s[tag=tied_off,tag=!shield_counter_selected] run tellraw @a[tag=display_shelds_tell_temp] {"text":"-","bold":true,"color":"gold"}
execute as @s[tag=tied_off,tag=shield_counter_selected] run tellraw @a[tag=display_shelds_tell_temp] ["",{"text":"-","bold":true,"color":"gold"},{"text":"<","bold":true,"color":"dark_red"}]