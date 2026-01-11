################################################################################
#Purpose: Run all ticked player logic for when stilled
#Runner: All stilled players, run via events/player_tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute as @s[scores={sneak_time=1..,tap_block_percentage=0}, tag=!tap_blocked] store result score @s reg_1 run data get entity @s Rotation[1]
execute as @s[scores={sneak_time=..10, reg_1=-90,tap_block_percentage=0}, tag=stilled,tag=!tap_blocked] run scoreboard players set @s sneak_time 0
execute as @s[scores={sneak_time=10,tap_block_percentage=0}, tag=!tap_blocked] at @s run playsound minecraft:block.vault.activate player @s
execute as @s[scores={sneak_time=10,tap_block_percentage=0}, tag=!tap_blocked] run tellraw @s {"text":"~~~~","color":"gold"}
execute as @s[scores={sneak_time=10,tap_block_percentage=0}, tag=!tap_blocked] run scoreboard players add @s sneak_time 1