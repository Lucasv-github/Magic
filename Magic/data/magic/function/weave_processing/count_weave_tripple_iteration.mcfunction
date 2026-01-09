################################################################################
#Purpose: Add to index denoted by $(i) then count matching elements combination with a length of 3 in weave denoted by $(index) and add to @s reg_1 until end of weave or newline
#Runner: An armorstand decoding its contained weave and counting a 3 length element combination, run via weave_processing/count_weave_single or by itself
#Authors: Lprogrammer
################################################################################

scoreboard players set @s reg_2 0
scoreboard players set @s reg_3 0
scoreboard players set @s reg_4 0
$execute store result score @s reg_2 run data get storage magic:weave_$(index) Elements[$(i)]
$execute store result score @s reg_3 run data get storage magic:weave_$(index) Elements[$(i_1)]
$execute store result score @s reg_4 run data get storage magic:weave_$(index) Elements[$(i_2)]

#Add to i
$scoreboard players set @s reg_5 $(i)
scoreboard players add @s reg_5 1
execute store result storage magic:count_weave_tripple_iteration i int 1 run scoreboard players get @s reg_5

#Add to i_1
$scoreboard players set @s reg_5 $(i_1)
scoreboard players add @s reg_5 1
execute store result storage magic:count_weave_tripple_iteration i_1 int 1 run scoreboard players get @s reg_5

#Add to i_2
$scoreboard players set @s reg_5 $(i_2)
scoreboard players add @s reg_5 1
execute store result storage magic:count_weave_tripple_iteration i_2 int 1 run scoreboard players get @s reg_5

execute if score @s reg_2 = Temp reg_1 if score @s reg_3 = Temp reg_2 if score @s reg_4 = Temp reg_3 run scoreboard players add @s reg_1 1
execute if score @s reg_3 matches 1.. run function magic:weave_processing/count_weave_tripple_iteration with storage magic:count_weave_tripple_iteration