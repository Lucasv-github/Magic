$execute store result score @s reg_2 run data get storage magic:weave_$(index) Elements[$(i)]
$execute store result score @s reg_3 run data get storage magic:match_weave_$(match_index) Elements[$(j)]

#Add to i
$scoreboard players set @s reg_4 $(i)
scoreboard players add @s reg_4 1
execute store result storage magic:match_weave_iteration i int 1 run scoreboard players get @s reg_4

#Add to j
$scoreboard players set @s reg_4 $(j)
scoreboard players add @s reg_4 1
execute store result storage magic:match_weave_iteration j int 1 run scoreboard players get @s reg_4

#Set to zero if not equal (this will also handle out of bond termination)
execute unless score @s reg_2 = @s reg_3 run scoreboard players set @s reg_1 0

#Set to success again if match only stops
execute if score @s reg_3 matches 0 run scoreboard players set @s reg_1 1

#End if both aren't equal or if match stops
execute unless score @s reg_1 matches 0 unless score @s reg_3 matches 0 run function magic:weave_processing/match_weave_iteration with storage magic:match_weave_iteration

