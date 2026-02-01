################################################################################
#Purpose: Set different build mode based on the players use_items value
#Runner: A player that has changed their buildmode, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute if score @s use_items matches 0 unless score @s use_items_current matches 0 run function magic:magic_actions/set_mode_empty
execute if score @s use_items matches 1 unless score @s use_items_current matches 1 run function magic:magic_actions/set_mode_items
execute if score @s use_items matches 2 unless score @s use_items_current matches 2 run function magic:magic_actions/set_mode_auto

scoreboard players set @s use_items -1