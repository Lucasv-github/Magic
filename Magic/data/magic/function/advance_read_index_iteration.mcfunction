scoreboard players set @s reg_2 0
$execute store result score @s reg_2 run data get storage magic:weave_$(index) Elements[$(i)]

#Add to i
$scoreboard players set @s reg_3 $(i)
scoreboard players add @s reg_3 1
execute store result storage magic:advance_read_index_iteration i int 1 run scoreboard players get @s reg_3

$execute unless score @s reg_2 matches 1.. run scoreboard players set @s weave_read_index $(i)
execute unless score @s reg_2 matches 1.. run scoreboard players add @s weave_read_index 1

#Check if ends, if so repeat
$execute unless score @s reg_2 matches 1.. store result score @s reg_4 run data get storage magic:weave_$(index) Elements
execute unless score @s reg_2 matches 1.. if score @s reg_4 < @s reg_3 run scoreboard players set @s weave_read_index 0
execute unless score @s reg_2 matches 1.. if score @s reg_4 < @s reg_3 run tag @s add weave_lapsed

execute if score @s reg_2 matches 1.. run function magic:advance_read_index_iteration with storage magic:advance_read_index_iteration