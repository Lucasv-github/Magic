################################################################################
#Purpose: Run everything that needs to happen in a tick loop in magic
#Runner: Called by Minecraft 20 times per second
#Return values:
#Authors: Lprogrammer
################################################################################

execute as @e[tag=awaiting_fill] run function magic:actions/check_awaiting_fill

#These need to be before the tick logic
#Throw
execute as @e[tag=weave_thrower] run function magic:weave_actions/throw_lock
#Bind
execute as @e[tag=weave_bind] run function magic:weave_actions/bind_lock

execute as @e[tag=using, tag=can_use, scores={line=1..}] run function magic:weave_handling/add_line
execute as @e[tag=using, tag=can_use, scores={build=1..}] run function magic:weave_handling/entire_weave


execute as @a run function magic:events/player_tick

#Weave drop removal
execute as @e[type=item] if items entity @s contents minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run function magic:cleanup/remove_cleanup_player_single

#Remove interaction items dropped
execute as @e[type=item] if data entity @s Item.components.minecraft:custom_data.Magic_interaction run kill @s

#Clean old weaves
kill @e[type=minecraft:armor_stand,tag=target_point, scores={weave_despawn_time=0},tag=!actively_held]

#Handle destroyed
execute as @e[type=armor_stand,tag=target_point,tag=weave_lapsed,tag=weave_damaged] run function magic:weave_handling/remove_weave
tag @e[type=armor_stand,tag=target_point,tag=weave_lapsed] remove weave_damaged

#Check if the throw has landed
execute as @e[type=armor_stand,tag=target_point,tag=weave_throw_damaged] run function magic:cleanup/throw_check_weave_remove


scoreboard players add Temp tick_counter 1
scoreboard players add Temp total_ticks 1

scoreboard players operation Temp reg_1 = Temp tick_counter
scoreboard players operation Temp reg_1 %= 5 reg_1
execute if score Temp reg_1 matches 0 run function magic:events/fourth_sec

execute if score Temp tick_counter matches 21.. run function magic:events/second
execute if score Temp tick_counter matches 21.. run scoreboard players set Temp tick_counter 0