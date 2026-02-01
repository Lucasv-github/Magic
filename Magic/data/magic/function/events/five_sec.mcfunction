################################################################################
#Purpose: Gets run every five seconds
#Runner: Server, gets run via tick.mcfunction->second.mcfunction->five_sec.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Very faint
execute at @e[tag=target_point,tag=!inverted] run particle minecraft:glow ~ ~2 ~ 0 0 0 0 1 normal @a[tag=can_see]

#Non player placed removal
execute as @e[tag=nonplayer_origin,tag=tied_off,scores={weave_remaining_time=1..}] run function magic:cleanup/remove_no_owner
execute as @e[tag=nonplayer_origin,tag=actively_held] run function magic:cleanup/remove_no_owner

execute as @a[scores={regenerated_strength=1.., shilded=1..,click_counter=10..,break_tied=0}, tag=!using, tag=can_use, tag=!circled,tag=!can_break_free] run function magic:magic_actions/try_break_held

#Messages
execute as @a[tag=can_use, tag=using, tag=circle_owner] run function magic:display/circle_info

#TODO posible to remove function and put the stuff in here?
execute as @a[tag=using] run function magic:five_broadcasts

execute as @e[type=armor_stand,tag=actively_held,tag=weave_shield] run scoreboard players operation @s current_drain -= @s shield_punish_draw
execute as @e[type=armor_stand,tag=actively_held,tag=weave_shield] run scoreboard players set @s shield_punish_draw 0

scoreboard players set @a click_counter 0