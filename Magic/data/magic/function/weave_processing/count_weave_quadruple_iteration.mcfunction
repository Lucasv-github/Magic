scoreboard players set @s reg_2 0
scoreboard players set @s reg_3 0
scoreboard players set @s reg_4 0
scoreboard players set @s reg_5 5
$execute store result score @s reg_2 run data get storage magic:weave_$(index) Elements[$(i)]
$execute store result score @s reg_3 run data get storage magic:weave_$(index) Elements[$(i_1)]
$execute store result score @s reg_4 run data get storage magic:weave_$(index) Elements[$(i_2)]
$execute store result score @s reg_5 run data get storage magic:weave_$(index) Elements[$(i_3)]

#Add to i
$scoreboard players set @s reg_6 $(i)
scoreboard players add @s reg_6 1
execute store result storage magic:count_weave_quadruple_iteration i int 1 run scoreboard players get @s reg_6

#Add to i_1
$scoreboard players set @s reg_6 $(i_1)
scoreboard players add @s reg_6 1
execute store result storage magic:count_weave_quadruple_iteration i_1 int 1 run scoreboard players get @s reg_6

#Add to i_2
$scoreboard players set @s reg_6 $(i_2)
scoreboard players add @s reg_6 1
execute store result storage magic:count_weave_quadruple_iteration i_2 int 1 run scoreboard players get @s reg_6

#Add to i_3
$scoreboard players set @s reg_6 $(i_3)
scoreboard players add @s reg_6 1
execute store result storage magic:count_weave_quadruple_iteration i_3 int 1 run scoreboard players get @s reg_6

execute if score @s reg_2 = Temp reg_1 if score @s reg_3 = Temp reg_2 if score @s reg_4 = Temp reg_3 if score @s reg_5 = Temp reg_4 run scoreboard players add @s reg_1 1
execute if score @s reg_3 matches 1.. run function magic:weave_processing/count_weave_quadruple_iteration with storage magic:count_weave_quadruple_iteration