################################################################################
#Purpose: Mainly set up well_amount and well_slot needed to make drawing power from a well work
#Arguments: @s reg_1: Well_current_amount
#Runner: A player who used a well
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation @s well_amount = @s reg_1
execute store result score @s well_slot run data get entity @s SelectedItemSlot

tag @s[scores={well_amount=1..}] add welled

execute at @s[tag=welld] run playsound minecraft:block.anvil.place ambient @s

#In case of death to prevent strength exploit
scoreboard players operation Temp reg_1 = @s well_slot
scoreboard players set Temp reg_2 0
execute as @s[tag=welled] run function magic:magic_actions/set_well_amount

tag @s add current_player_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:debug/console_write_enter_well
tag @s remove current_player_for_log
