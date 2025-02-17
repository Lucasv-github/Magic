$scoreboard players set @s reg_1 $(index)
scoreboard players add @s reg_1 1
execute store result storage magic:remove_cleanup_player_all_iteration index int 1 run scoreboard players get @s reg_1

scoreboard players set @s reg_1 0
$execute store result score @s reg_1 run data get entity @s Inventory[$(index)].components.minecraft:custom_data.Player_weave_index

execute store result storage magic:remove_weave_data index int 1 run scoreboard players get @s reg_1
execute as @s[scores={reg_1=1..}] run function magic:cleanup/remove_weave_data with storage magic:remove_weave_data

$execute if data entity @s Inventory[$(index)] run function magic:cleanup/remove_cleanup_player_all_iteration with storage magic:remove_cleanup_player_all_iteration