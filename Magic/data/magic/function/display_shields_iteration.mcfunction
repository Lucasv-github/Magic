execute as @s[tag=actively_held,tag=!shield_counter_selected] run tellraw @a[tag=display_shelds_tell_temp] {"text":"-","bold":true,"color":"gold"}
execute as @s[tag=actively_held,tag=shield_counter_selected] run tellraw @a[tag=display_shelds_tell_temp] ["",{"text":"-","bold":true,"color":"gold"},{"text":"<","bold":true,"color":"dark_red"}]


execute as @s[tag=tied_off,tag=!shield_counter_selected] run tellraw @a[tag=display_shelds_tell_temp] {"text":"~","bold":true,"color":"gold"}
execute as @s[tag=tied_off,tag=shield_counter_selected] run tellraw @a[tag=display_shelds_tell_temp] ["",{"text":"~","bold":true,"color":"gold"},{"text":"<","bold":true,"color":"dark_red"}]