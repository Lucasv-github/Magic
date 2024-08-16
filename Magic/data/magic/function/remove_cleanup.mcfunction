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

#TODO only if lone
execute as @s[scores={t_1=1,t_2=1,t_3=1,t_4=0}] as @a[tag=can_use] if score @s player_id = Temp reg_1 run effect clear @s slowness

execute as @s[scores={t_1=5,t_2=5,t_3=5,t_4=0}] as @a[tag=can_use, scores={shilded=1..}] if score @s player_id = Temp reg_1 run scoreboard players set @s shilded 0
execute as @s[scores={t_1=5,t_2=5,t_3=5,t_4=0}] as @a[tag=can_use, scores={progressive_shielded=1..}] if score @s player_id = Temp reg_1 run scoreboard players set @s progressive_shielded 0

execute as @s[scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0}] as @a[tag=can_use, scores={shilded=1..}] if score @s player_id = Temp reg_1 run scoreboard players set @s shilded 0
execute as @s[scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0}] as @a[tag=can_use, scores={progressive_shielded=1..}] if score @s player_id = Temp reg_1 run scoreboard players set @s progressive_shielded 0


execute at @s[scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=3,t_6=3,t_7=3,t_8=3,t_9=0}] run fill ~5 ~5 ~5 ~-5 ~-5 ~-5 minecraft:air replace minecraft:glass

execute as @s[scores={t_1=1,t_2=3,t_3=1,t_4=3,t_5=3,t_6=3,t_7=0}] as @a if score @s player_id = Temp reg_2 run clear @s golden_sword

scoreboard players operation Temp reg_1 = @s weave_execute_random_number
execute as @e[type=minecraft:armor_stand, tag=destroy_bridge, tag=!previous_bridge] if score Temp reg_1 = @s weave_execute_random_number run function magic:remove_bridge

#Handle bound
execute as @s[scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=0}] on passengers run scoreboard players set @s bound 1

tag @s remove tied_off
tag @s remove actively_held

#TODO deprecate?
tag @s remove holds_travel

