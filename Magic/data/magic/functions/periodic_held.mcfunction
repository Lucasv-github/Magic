#Get count
execute store result score Temp reg_4 run data get entity @s Inventory
execute store result storage periodic_held_index i int 1 run scoreboard players get Temp reg_4
function magic:periodic_held_one with storage minecraft:periodic_held_index