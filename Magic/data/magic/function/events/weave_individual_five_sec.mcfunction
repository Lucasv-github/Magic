#Run tied off
tag @s[tag=target_point, tag=tied_off, scores={weave_remaining_time=1..},tag=!weave_ward] add running_tied
execute as @s[type=minecraft:armor_stand,tag=target_point, tag=tied_off, scores={weave_remaining_time=1..},tag=!weave_ward] run function magic:weaves
tag @s[tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},tag=!weave_ward] remove running_tied

#Run held
execute as @s[tag=actively_held,tag=!no_weave,tag=!weave_ward] run function magic:pre_weaves

scoreboard players set @s weave_second_counter 0
