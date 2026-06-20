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

#Messages
execute as @a[tag=can_use, tag=using, tag=circle_owner] run function magic:display/circle_info

#Shield handling
execute as @e[type=armor_stand,tag=weave_shield,tag=held_shield_was_overpowered] run say my owner lost hold of it
tag @e[type=armor_stand,tag=weave_shield] remove held_shield_was_overpowered
execute as @e[type=armor_stand,tag=actively_held,tag=weave_shield] run scoreboard players operation @s current_drain -= @s shield_punish_draw
tag @e[type=armor_stand,tag=weave_shield,tag=!actively_held,scores={shield_punish_draw=1..}] add held_shield_was_overpowered
execute as @e[type=armor_stand,tag=weave_shield] run scoreboard players set @s shield_punish_draw 0

scoreboard players set @a click_counter 0