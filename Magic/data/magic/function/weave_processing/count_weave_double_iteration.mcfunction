scoreboard players set @s reg_2 0
scoreboard players set @s reg_3 0
$execute store result score @s reg_2 run data get storage magic:weave_$(index) Elements[$(i)]
$execute store result score @s reg_3 run data get storage magic:weave_$(index) Elements[$(i_1)]

#Add to i
$scoreboard players set @s reg_4 $(i)
scoreboard players add @s reg_4 1
execute store result storage magic:count_weave_double_iteration i int 1 run scoreboard players get @s reg_4

#Add to i_1
$scoreboard players set @s reg_4 $(i_1)
scoreboard players add @s reg_4 1
execute store result storage magic:count_weave_double_iteration i_1 int 1 run scoreboard players get @s reg_4

execute if score @s reg_2 = Temp reg_1 if score @s reg_3 = Temp reg_2 run scoreboard players add @s reg_1 1
execute if score @s reg_3 matches 1.. run function magic:weave_processing/count_weave_double_iteration with storage magic:count_weave_double_iteration