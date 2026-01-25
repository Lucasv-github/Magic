################################################################################
#Purpose: Gets run every second
#Runner: Server, gets run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

execute as @a[tag=can_use, tag=using] run function magic:power_handling/periodic_draw
execute as @a[tag=can_use, tag=using,tag=circle_owner] run function magic:power_handling/periodic_draw_circle

#Run tied off wards
tag @e[type=minecraft:armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..},tag=weave_ward] add running_tied
execute as @e[type=minecraft:armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..},tag=weave_ward] run function magic:weaves
tag @e[type=minecraft:armor_stand,tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},tag=weave_ward] remove running_tied

#Run held wards
execute as @e[tag=actively_held,tag=!no_weave,tag=weave_ward] run function magic:pre_weaves

execute as @e[tag=target_point,tag=tied_off,scores={weave_remaining_time=1..}] at @s run function magic:display/display_composition_calculate
execute as @e[tag=target_point,tag=gateway_end,scores={weave_remaining_time=1..}] at @s run function magic:display/display_composition_calculate
execute as @e[tag=target_point,tag=actively_held] at @s run function magic:display/display_composition_calculate

execute as @e[tag=target_point,tag=tied_off,scores={weave_remaining_time=0}] run function magic:cleanup/remove_cleanup

scoreboard players remove @a[scores={shields_blocked=1..}] shields_blocked 1
scoreboard players remove @a[scores={disguise=1..}] disguise 1
scoreboard players remove @e[scores={finder_time=1..}] finder_time 1
scoreboard players remove @e[scores={projectile_shielded=1..}] projectile_shielded 1

scoreboard players remove @e[type=minecraft:armor_stand,tag=target_point, scores={weave_remaining_time=1..},tag=!actively_held] weave_remaining_time 1

#Not active signifies that it is still held
scoreboard players remove @e[type=minecraft:armor_stand,tag=target_point, scores={weave_despawn_time=1..},tag=!actively_held] weave_despawn_time 1

execute as @e[tag=using,tag=can_use] run function magic:power_handling/tap_power

execute as @a[tag=circled] run function magic:power_handling/tap_power_circle_member
execute as @a[tag=circle_owner] run function magic:power_handling/tap_power_circle_member

scoreboard players add @e[type=minecraft:armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..},tag=!weave_ward] weave_second_counter 1
scoreboard players add @e[type=minecraft:armor_stand,tag=actively_held,tag=!no_weave,tag=!weave_ward] weave_second_counter 1

execute as @e[type=minecraft:armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..,weave_second_counter=5..},tag=!weave_ward] run function magic:events/weave_individual_five_sec
execute as @e[type=minecraft:armor_stand,tag=actively_held,tag=!no_weave,tag=!weave_wards,scores={weave_second_counter=5..}] run function magic:events/weave_individual_five_sec

#Power sinking
execute as @e[type=minecraft:armor_stand, tag=weave_sink_power, tag=actively_held] run function magic:magic_actions/sink_power

scoreboard players add Temp second_counter 1

scoreboard players operation Temp reg_1 = Temp second_counter
scoreboard players operation Temp reg_1 %= 5 reg_1
execute if score Temp reg_1 matches 0 run function magic:events/five_sec

scoreboard players operation Temp reg_1 = Temp second_counter
scoreboard players operation Temp reg_1 %= 10 reg_1
execute if score Temp reg_1 matches 0 run function magic:events/ten_sec

execute if score Temp second_counter matches 61.. run function magic:events/minute
execute if score Temp second_counter matches 61.. run scoreboard players set Temp second_counter 0