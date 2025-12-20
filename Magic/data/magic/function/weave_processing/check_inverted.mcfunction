function magic:weave_handling/weave_counters

#Inverting
execute as @s[scores={weave_read_index=1..,weave_spirit_count=5,weave_spirit_count_1=4}] run function magic:base_weaves/weave_invert

scoreboard players set @s weave_read_index 0