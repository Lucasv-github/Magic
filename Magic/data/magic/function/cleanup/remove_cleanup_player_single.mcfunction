execute at @s run scoreboard players operation Temp reg_1 = @a[limit=1,sort=nearest] player_id
execute store result score Temp reg_2 run data get entity @s Item.components.minecraft:custom_data.Player_weave_index

execute as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run function magic:cleanup/remove_cleanup

#Fallback if none placed existed
execute store result storage magic:remove_weave_data index int 1 run data get entity @s Item.components.minecraft:custom_data.Player_weave_index
function magic:cleanup/remove_weave_data with storage magic:remove_weave_data

kill @s