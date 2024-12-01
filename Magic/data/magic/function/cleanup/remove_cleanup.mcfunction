#say remove cleanup

#Travel: This is supposed to run as the "main" else everything will fail

#Remove gateway from mail
#TODO branch out
execute at @s[tag=holds_travel] run function magic:cleanup/travel_dismantle
execute as @s[tag=holds_travel] run scoreboard players operation Temp reg_1 = @s weave_execute_random_number
execute as @s[tag=holds_travel] run scoreboard players operation Temp reg_2 = @s weave_despawn_time
execute as @s[tag=holds_travel] as @e[tag=gateway_end] if score @s weave_execute_random_number = Temp reg_1 run scoreboard players operation @s weave_despawn_time = Temp reg_2
execute as @s[tag=holds_travel] as @e[tag=gateway_end] if score @s weave_execute_random_number = Temp reg_1 at @s run function magic:cleanup/travel_dismantle
execute as @s[tag=holds_travel] as @e[tag=gateway_end] if score @s weave_execute_random_number = Temp reg_1 at @s run tag @s remove gateway_end
execute as @s[tag=holds_travel] in minecraft:overworld positioned 0 -80 0 as @e[type=minecraft:armor_stand,distance=..1,tag=gateway_blocked] if score @s weave_execute_random_number = Temp reg_1 run kill @s

#function magic:remove_light_beam

#Handle cut at both sides
execute as @s[tag=gateway_end] run function magic:cleanup/travel_dismantle

scoreboard players operation Temp reg_1 = @s weave_locked_player_id
scoreboard players operation Temp reg_2 = @s weave_owner_player_id
scoreboard players operation Temp reg_3 = @s weave_locked_entity_id
scoreboard players operation Temp reg_4 = @s player_weave_index

#TODO weave_locked_entity_id bad as it could remove someone elses

#Bound
execute as @s[tag=weave_bind] as @e if score @s entity_id = Temp reg_3 run ride @s dismount

#Throw
execute as @s[tag=weave_throw] as @e[tag=weave_thrower] if score @s player_weave_index = Temp reg_4 run kill @s

#Levitate
execute as @s[tag=weave_levitate] as @e if score @s entity_id = Temp reg_3 run effect clear @s minecraft:levitation

#Resistance
execute as @s[tag=weave_resistance] as @e if score @s entity_id = Temp reg_3 run effect clear @s minecraft:resistance

#Bridge
#Cleanup won't touch any reg, thus this is fine
execute as @s[tag=weave_bridge] as @e[tag=bridge_start,type=armor_stand] if score @s player_weave_index = Temp reg_4 run kill @s
execute as @s[tag=weave_bridge] as @e[tag=bridge,type=armor_stand] if score @s player_weave_index = Temp reg_4 store result storage magic:remove_bridge size int 1 run scoreboard players get @s weave_air_count
execute as @s[tag=weave_bridge] as @e[tag=bridge,type=armor_stand] if score @s player_weave_index = Temp reg_4 run function magic:cleanup/remove_bridge with storage magic:remove_bridge

#Air box
execute as @s[tag=weave_air_box] run scoreboard players operation Temp reg_1 = @s weave_air_count
execute as @s[tag=weave_air_box] run function magic:math/square_root
execute as @s[tag=weave_air_box] store result storage magic:remove_air_box size int 1 run scoreboard players get Temp reg_1
execute as @s[tag=weave_air_box] run function magic:remove_air_box with storage magic:remove_air_box

execute as @s[tag=weave_fire_sword] as @a if score @s player_id = Temp reg_2 run clear @s minecraft:golden_sword[custom_data~{Magic:30}]
execute as @s[tag=weave_fire_axe] as @a if score @s player_id = Temp reg_2 run clear @s minecraft:golden_axe[custom_data~{Magic:31}]
execute as @s[tag=weave_fire_pickaxe] as @a if score @s player_id = Temp reg_2 run clear @s minecraft:golden_pickaxe[custom_data~{Magic:32}]

execute store result storage magic:remove_weave_data index int 1 run scoreboard players get @s player_weave_index
function magic:cleanup/remove_weave_data with storage magic:remove_weave_data

tag @s remove tied_off
tag @s remove actively_held


execute at @s run function magic:detections/can_unload
execute if score Temp reg_1 matches 1 at @s run forceload remove ~ ~

#TODO deprecate?
tag @s remove holds_travel

