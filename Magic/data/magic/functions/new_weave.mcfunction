scoreboard players set @s[tag=built] state 0
scoreboard players set @s[tag=built] stage 0

scoreboard players add @s[tag=built] player_weave_index 1
#scoreboard players operation @s player_weave_index_current = @s player_weave_index

tag @s remove built
tag @s remove active

#Prevent held execute again, SHOULD NOT
#scoreboard players operation Temp reg_1 = @s player_id
#execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,scores={state=1}] if score @s player_id = Temp reg_1 run function magic:remove_cleanup

#Reset weave
scoreboard players set @s t_1 0
scoreboard players set @s t_2 0
scoreboard players set @s t_3 0
scoreboard players set @s t_4 0
scoreboard players set @s t_5 0
scoreboard players set @s t_6 0
scoreboard players set @s t_7 0
scoreboard players set @s t_8 0
scoreboard players set @s t_9 0
scoreboard players set @s t_10 0
scoreboard players set @s t_11 0
scoreboard players set @s t_12 0
scoreboard players set @s t_13 0
scoreboard players set @s t_14 0
scoreboard players set @s t_15 0
scoreboard players set @s t_16 0
scoreboard players set @s t_17 0
scoreboard players set @s t_18 0
scoreboard players set @s t_19 0
scoreboard players set @s t_20 0