execute at @s run playsound minecraft:block.lever.click player @s

execute at @s as @e[type=armor_stand,scores={weave_remaining_time=1..},distance=..5,sort=nearest,tag=tied_off] if score @s player_id = Temp reg_1 run tag @s add getting_picked_up
execute at @s as @e[type=armor_stand,scores={weave_remaining_time=1..},distance=..5,sort=nearest,tag=tied_off] if score @s player_id = Temp reg_1 run tag @a[tag=using,tag=!built, sort=nearest, limit=1] add picking_up

#Make sure we can pick up something
scoreboard players operation Temp reg_1 = @s[tag=picking_up] weave_execute_id

#execute as @e[tag=getting_picked_up] run say getting_picked_up
#execute as @s[tag=picking_up] run say picking_up

tag @s[tag=picking_up] add built
tag @e[tag=getting_picked_up] remove tied_off
tag @e[tag=getting_picked_up] add actively_held

scoreboard players operation @s[tag=picking_up] stage = @e[tag=getting_picked_up] stage

#Want to keep tied off position
scoreboard players operation @e[tag=getting_picked_up] player_weave_index = @s[tag=picking_up] player_weave_index

#Copy data
scoreboard players operation @s[tag=picking_up] t_1 = @e[tag=getting_picked_up] t_1
scoreboard players operation @s[tag=picking_up] t_2 = @e[tag=getting_picked_up] t_2
scoreboard players operation @s[tag=picking_up] t_3 = @e[tag=getting_picked_up] t_3
scoreboard players operation @s[tag=picking_up] t_4 = @e[tag=getting_picked_up] t_4
scoreboard players operation @s[tag=picking_up] t_5 = @e[tag=getting_picked_up] t_5
scoreboard players operation @s[tag=picking_up] t_6 = @e[tag=getting_picked_up] t_6
scoreboard players operation @s[tag=picking_up] t_7 = @e[tag=getting_picked_up] t_7
scoreboard players operation @s[tag=picking_up] t_8 = @e[tag=getting_picked_up] t_8
scoreboard players operation @s[tag=picking_up] t_9 = @e[tag=getting_picked_up] t_9
scoreboard players operation @s[tag=picking_up] t_10 = @e[tag=getting_picked_up] t_10
scoreboard players operation @s[tag=picking_up] t_11 = @e[tag=getting_picked_up] t_11
scoreboard players operation @s[tag=picking_up] t_12 = @e[tag=getting_picked_up] t_12
scoreboard players operation @s[tag=picking_up] t_13 = @e[tag=getting_picked_up] t_13
scoreboard players operation @s[tag=picking_up] t_14 = @e[tag=getting_picked_up] t_14
scoreboard players operation @s[tag=picking_up] t_15 = @e[tag=getting_picked_up] t_15
scoreboard players operation @s[tag=picking_up] t_16 = @e[tag=getting_picked_up] t_16
scoreboard players operation @s[tag=picking_up] t_17 = @e[tag=getting_picked_up] t_17
scoreboard players operation @s[tag=picking_up] t_18 = @e[tag=getting_picked_up] t_18
scoreboard players operation @s[tag=picking_up] t_19 = @e[tag=getting_picked_up] t_19
scoreboard players operation @s[tag=picking_up] t_20 = @e[tag=getting_picked_up] t_20

execute as @s[tag=picking_up] run function magic:give_current_weave

tag @e remove getting_picked_up
tag @s remove picking_up

scoreboard players set @s state 0
