#Very faint
execute at @e[tag=target_point,tag=!inverted] run particle minecraft:glow ~ ~2 ~ 0 0 0 0 1 normal @a[tag=can_see]

#Run tied off
tag @e[type=minecraft:armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..},tag=!weave_ward] add running_tied
execute as @e[type=minecraft:armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..},tag=!weave_ward] run function magic:weaves
tag @e[type=minecraft:armor_stand,tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},tag=!weave_ward] remove running_tied

#Run held
execute as @e[tag=actively_held,tag=!no_weave,tag=!weave_ward] run function magic:pre_weaves

execute as @a[scores={regenerated_strength=1.., shilded=1..,click_counter=10..,break_tied=0}, tag=!using, tag=can_use, tag=!circled,tag=!can_break_free] run function magic:magic_actions/try_break_held

#Messages
execute as @a[tag=can_use, tag=using, tag=circle_owner] run function magic:display/circle_info

#TODO posible to remove function and put the stuff in here?
execute as @a[tag=using] run function magic:five_broadcasts

#execute as @a[tag=can_use,tag=!using,scores={disguise=0}] at @s run tellraw @a[tag=can_see,distance=..10] ["",{"selector":"@s","color":"gold"},{"text":" Can use","color":"gold"}]

execute as @e[scores={finder_time=1..}] run function magic:tracked

scoreboard players set @a click_counter 0