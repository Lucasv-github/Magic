################################################################################
#Purpose: Add to index denoted by $(i) then count matching elements in weave denoted by $(index) and add to @s reg_1 until end of weave or newline
#Runner: An armorstand decoding its contained weave and counting a single elements, run via weave_processing/count_weave_single or by itself
#Authors: Lprogrammer
################################################################################

scoreboard players set @s reg_2 0
$execute store result score @s reg_2 run data get storage magic:weave_$(index) Elements[$(i)]

#Add to i
$scoreboard players set @s reg_3 $(i)
scoreboard players add @s reg_3 1
execute store result storage magic:count_weave_single_iteration i int 1 run scoreboard players get @s reg_3

execute if score @s reg_2 = Temp reg_1 run scoreboard players add @s reg_1 1
execute if score @s reg_2 matches 1.. run function magic:weave_processing/count_weave_single_iteration with storage magic:count_weave_single_iteration