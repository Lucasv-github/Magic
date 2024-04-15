#Need to setup for holding_run_first
item replace entity @s weapon.mainhand from entity @s weapon.offhand


#Sets things right
function magic:holding_run_first

#Need to make them tied off
scoreboard players operation Temp reg_1 = @s player_id
execute as @s store result score Temp reg_2 run data get entity @s SelectedItem.tag.Player_weave_index
scoreboard players operation Temp reg_3 = @s tie_strenght

#Consume 1 power for each 20 seconds
scoreboard players operation @s current_held -= @s tie_strenght
scoreboard players operation Temp reg_3 *= 20 reg_1


#Need current held check as it is possible to drop

execute if score @s current_held matches 1.. as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add tied_off
execute if score @s current_held matches 1.. as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run scoreboard players operation @s weave_remaining_time = Temp reg_3

#Need to be last
execute if score @s current_held matches 1.. as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s remove actively_held

#Clear all items
item replace entity @s weapon.mainhand with minecraft:air
item replace entity @s weapon.offhand with minecraft:air