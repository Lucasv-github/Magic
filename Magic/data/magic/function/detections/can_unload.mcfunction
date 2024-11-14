#Making this a bit more robust, to make it work if @s isn't a target_point
execute store result score @s reg_1 run data get entity @s Pos[0]
execute store result score @s reg_2 run data get entity @s Pos[2]

scoreboard players operation @s reg_1 /= 16 reg_1
scoreboard players operation @s reg_2 /= 16 reg_1


execute as @e[tag=actively_held,tag=target_point] run tag @s add can_unload_blocker_temp
execute as @e[tag=actively_held,tag=tied_off,scores={weave_remaining_time=1..}] run tag @s add can_unload_temp

execute as @e[tag=can_unload_blocker_temp] store result score @s reg_1 run data get entity @s Pos[0]
execute as @e[tag=can_unload_blocker_temp] store result score @s reg_2 run data get entity @s Pos[2]

execute as @e[tag=can_unload_blocker_temp] run scoreboard players operation @s reg_1 /= 16 reg_1
execute as @e[tag=can_unload_blocker_temp] run scoreboard players operation @s reg_2 /= 16 reg_1

tag @s add can_unload_self_temp

scoreboard players set Temp reg_1 1
execute as @e[tag=can_unload_blocker_temp] if score @s reg_1 = @e[tag=can_unload_self_temp,limit=1] reg_1 if score @s reg_2 = @e[tag=can_unload_self_temp,limit=1] reg_2 run scoreboard players set Temp reg_1 0

tag @e remove can_unload_self_temp
tag @e remove can_unload_blocker_temp

