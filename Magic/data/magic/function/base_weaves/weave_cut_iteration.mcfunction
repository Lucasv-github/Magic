#TODO replace with function with better name
execute at @s run function magic:weaves/weave_cut_hard

scoreboard players remove Cut_count reg_1 1
execute if score Cut_count reg_1 matches 1.. run function magic:base_weaves/weave_cut_iteration