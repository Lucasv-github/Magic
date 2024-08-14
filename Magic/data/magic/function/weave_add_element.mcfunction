#Doesn't matter
$data modify storage magic:weave_$(index) Elements append value 0
$execute store result storage magic:weave_$(index) Elements[-1] int 1.0 run scoreboard players get @s reg_1