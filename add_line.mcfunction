execute store result storage magic:weave_add_element index int 1 run scoreboard players get @s player_weave_index

execute at @s run playsound minecraft:entity.sniffer.drop_seed player @s

#-1 for newline
scoreboard players set @s reg_1 -1
function magic:weave_handling/weave_add_element with storage magic:weave_add_element