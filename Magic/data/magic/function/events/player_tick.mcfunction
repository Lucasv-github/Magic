################################################################################
#Purpose: Run all ticked player logic
#Runner: All players one at a time every tick, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Join detect, also work first time when leave detect will be set to undef
execute unless score @s leave_detect matches 0 run function magic:events/join

#Needs to be below join detect, setting last online time
execute as @s run scoreboard players operation @s total_ticks = Temp total_ticks

execute as @s[tag=magic_admin] run function magic:admin_actions/admin_tick

#Need to be above opening
#TODO find way to offload
#Checking if there is a source to tap here
execute as @s[tag=can_use] run function magic:power_handling/check_tap_block_pre
execute as @s[tag=stilled] run function magic:power_handling/check_tap_block_pre

execute as @s[tag=can_use] run function magic:events/player_tick_can_use
execute as @s[tag=!using, tag=can_use] run function magic:events/player_tick_not_using
execute as @s[tag=using] run function magic:events/player_tick_using
execute as @s[tag=stilled] run function magic:events/player_tick_stilled

#Sneak reset expect when riding (need to be below Throw, Bind...)
execute as @s[scores={sneak_time=1..}] unless predicate magic:is_sneaking unless data entity @s RootVehicle run scoreboard players set @s sneak_time 0

#Clear interaction items from not using (to prevent taking from storage)
clear @s[tag=!using] *[minecraft:custom_data~{Magic_interaction:1b}]

#Doomed smite
execute as @s[scores={doomed=1..}] run function magic:events/doomed_tick

#Death detect
execute as @s[scores={death_detect=1..}] run function magic:events/death