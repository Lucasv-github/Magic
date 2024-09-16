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

execute at @s[scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=3,t_6=4,t_7=3,t_8=4,t_9=3,t_10=1,t_11=1,t_12=1,t_13=1}] run function magic:remove_light_beam

#Handle cut at both sides
execute as @s[tag=gateway_end] run function magic:travel_dismantle

scoreboard players operation Temp reg_1 = @s weave_locked_player_id
scoreboard players operation Temp reg_2 = @s player_id
scoreboard players operation Temp reg_3 = @s weave_locked_entity_id
scoreboard players operation Temp reg_4 = @s player_weave_index

#TODO only if lone
execute as @s[scores={t_1=1,t_2=1,t_3=1,t_4=0}] as @a[tag=can_use] if score @s player_id = Temp reg_1 run effect clear @s slowness

#Shields
execute as @s[tag=weave_shield] as @a[tag=can_use, scores={shilded=1..}] if score @s player_id = Temp reg_1 run scoreboard players set @s shilded 0

#Bound
execute as @s[tag=weave_bind] as @e if score @s entity_id = Temp reg_3 run ride @s dismount

#Throw
execute as @s[tag=weave_throw] as @e[tag=weave_thrower] if score @s weave_locked_entity_id = Temp reg_3 run kill @s

#Bridge
#Cleanup won't touch any reg, thus this is fine
execute as @s[tag=weave_bridge] as @e[tag=bridge_start,type=armor_stand] if score @s player_weave_index = Temp reg_4 run kill @s
execute as @s[tag=weave_bridge] as @e[tag=bridge,type=armor_stand] if score @s player_weave_index = Temp reg_4 store result storage magic:remove_bridge size int 1 run scoreboard players get @s weave_air_count
execute as @s[tag=weave_bridge] as @e[tag=bridge,type=armor_stand] if score @s player_weave_index = Temp reg_4 run function magic:remove_bridge with storage magic:remove_bridge

execute at @s[scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=3,t_6=3,t_7=3,t_8=3,t_9=0}] run fill ~5 ~5 ~5 ~-5 ~-5 ~-5 minecraft:air replace minecraft:glass

execute as @s[scores={t_1=1,t_2=3,t_3=1,t_4=3,t_5=3,t_6=3,t_7=0}] as @a if score @s player_id = Temp reg_2 run clear @s golden_sword


#Handle bound
execute as @s[scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=0}] on passengers run scoreboard players set @s bound 1

tag @s remove tied_off
tag @s remove actively_held

#TODO deprecate?
tag @s remove holds_travel

