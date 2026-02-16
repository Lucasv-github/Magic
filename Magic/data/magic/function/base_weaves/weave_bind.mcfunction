#say weave bind

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

#Lock free
execute at @s[scores={reg_1=1}] run data modify entity @s NoGravity set value 0b
execute at @s[scores={reg_1=1}] run data modify entity @s Marker set value 0b
execute at @s[scores={reg_1=1}] run tag @s add weave_bind

#Lock bound
execute at @s[scores={reg_1=2}] run tag @s add weave_bind

function magic:weave_processing/advance_read_index