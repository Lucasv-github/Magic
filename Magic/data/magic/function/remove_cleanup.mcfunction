#say RC

#Travel: This is supposed to run as the "main" else everything will fail

#Remove gateway from mail
#TODO branch out
execute at @s[tag=holds_travel] run function magic:travel_dismantle
execute as @s[tag=holds_travel] run scoreboard players operation Temp reg_1 = @s weave_execute_random_number
execute as @s[tag=holds_travel] run scoreboard players operation Temp reg_2 = @s weave_despawn_time
execute as @s[tag=holds_travel] as @e[tag=gateway_end] if score @s weave_execute_random_number = Temp reg_1 run scoreboard players operation @s weave_despawn_time = Temp reg_2
execute as @s[tag=holds_travel] as @e[tag=gateway_end] if score @s weave_execute_random_number = Temp reg_1 at @s run function magic:travel_dismantle
execute as @s[tag=holds_travel] as @e[tag=gateway_end] if score @s weave_execute_random_number = Temp reg_1 at @s run tag @s remove gateway_end
execute as @s[tag=holds_travel] in minecraft:overworld positioned 0 -80 0 as @e[type=minecraft:armor_stand,distance=..1,tag=gateway_blocked] if score @s weave_execute_random_number = Temp reg_1 run kill @s

#function magic:remove_light_beam

#Handle cut at both sides
execute as @s[tag=gateway_end] run function magic:travel_dismantle

scoreboard players operation Temp reg_1 = @s weave_locked_player_id
scoreboard players operation Temp reg_2 = @s player_id
scoreboard players operation Temp reg_3 = @s weave_locked_entity_id
scoreboard players operation Temp reg_4 = @s player_weave_index

#TODO weave_locked_entity_id bad as it could remove someone elses

#Bound
execute as @s[tag=weave_bind] as @e if score @s entity_id = Temp reg_3 run ride @s dismount

#Throw
execute as @s[tag=weave_throw] as @e[tag=weave_thrower] if score @s player_weave_index = Temp reg_4 run kill @s

#Bridge
#Cleanup won't touch any reg, thus this is fine
execute as @s[tag=weave_bridge] as @e[tag=bridge_start,type=armor_stand] if score @s player_weave_index = Temp reg_4 run kill @s
execute as @s[tag=weave_bridge] as @e[tag=bridge,type=armor_stand] if score @s player_weave_index = Temp reg_4 store result storage magic:remove_bridge size int 1 run scoreboard players get @s weave_air_count
execute as @s[tag=weave_bridge] as @e[tag=bridge,type=armor_stand] if score @s player_weave_index = Temp reg_4 run function magic:remove_bridge with storage magic:remove_bridge

#clear @s golden_sword

tag @s remove tied_off
tag @s remove actively_held

#TODO deprecate?
tag @s remove holds_travel

