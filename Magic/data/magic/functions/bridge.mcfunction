#The armorstands of each bridge needs to have their own unique id

#Preserve that
execute as @s[tag=!holds_bridge] run scoreboard players operation @s weave_execute_random_number = #random_id player_id

#And finally add to id
execute as @s[tag=!holds_bridge] run scoreboard players add #random_id player_id 1

scoreboard players operation Temp reg_1 = @s weave_execute_random_number

execute as @e[type=minecraft:armor_stand, tag=destroy] if score @s weave_execute_random_number = Temp reg_1 run scoreboard players set @s bridge 20

#Tied off, lower
execute as @s[tag=running_tied] as @e[type=minecraft:armor_stand, tag=destroy, scores={bridge=..10}] if score @s weave_execute_random_number = Temp reg_1 run scoreboard players set @s bridge 10

tag @s add holds_bridge