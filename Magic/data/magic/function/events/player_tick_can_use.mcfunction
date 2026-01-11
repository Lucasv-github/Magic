################################################################################
#Purpose: Run all ticked player logic for players that can use the power
#Runner: All players that can use the power, one at a time every tick, run via events/player_tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Doomed smite
execute as @s[scores={doomed=1..}] run function magic:events/doomed_tick

#Enable triggers
scoreboard players enable @s use_items
scoreboard players enable @s a
scoreboard players enable @s e
scoreboard players enable @s f
scoreboard players enable @s w
scoreboard players enable @s s
scoreboard players enable @s line
scoreboard players enable @s state

scoreboard players enable @s build
scoreboard players enable @s count 
scoreboard players enable @s slow_down
scoreboard players enable @s tie_strength