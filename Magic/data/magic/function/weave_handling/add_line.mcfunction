#Can only add line to weave in slot 9

execute store result storage magic:weave_storage_add_data index int 1 run scoreboard players get @s player_weave_index

execute at @s run playsound minecraft:entity.sniffer.drop_seed player @s

#-1 for newline
scoreboard players set @s reg_1 -1
function magic:weave_handling/weave_storage_add_data with storage magic:weave_storage_add_data
