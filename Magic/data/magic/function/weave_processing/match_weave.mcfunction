#Match against in Temp reg_1
#Output in @s reg_1

execute store result storage magic:match_weave_iteration match_index int 1 run scoreboard players get Temp reg_1
execute store result storage magic:match_weave_iteration index int 1 run scoreboard players get @s player_weave_index

execute store result storage magic:match_weave_iteration i int 1 run scoreboard players get 0 reg_1

scoreboard players set @s reg_1 1
function magic:weave_processing/match_weave_iteration with storage magic:match_weave_iteration


