################################################################################
#Purpose: Run all ticked player logic for when not using the power
#Runner: All players not using the power that can use it, one at a time every tick, run via events/player_tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#TODO branch out, nonzero sneak time
#Sneak
execute as @s[scores={sneak_time=1..,tap_block_percentage=0},tag=!tap_blocked] store result score @s reg_1 run data get entity @s Rotation[1]
execute as @s[scores={sneak_time=..10, reg_1=-90,tap_block_percentage=0},tag=!tap_blocked] run scoreboard players set @s sneak_time 0
execute as @s[scores={sneak_time=10,tap_block_percentage=0},tag=!tap_blocked] at @s run playsound minecraft:block.vault.activate player @s
execute as @s[scores={sneak_time=10,tap_block_percentage=0},tag=!tap_blocked] run tellraw @s {"text":"~~~~","color":"gold"}
execute as @s[scores={sneak_time=10,tap_block_percentage=0},tag=!tap_blocked] run scoreboard players add @s sneak_time 1

#Opening
execute as @s[scores={sneak_time=10..,reg_1=-90,tap_block_percentage=0},tag=!circled,tag=!tap_blocked] run function magic:power_handling/open

#Join circle
execute as @s[scores={state=10}, tag=!circled, tag=!circle_owner,tag=!tap_blocked] run function magic:power_handling/join_circle