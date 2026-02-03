#Will not touch the playerbound registers

scoreboard players set Temp reg_1 0

execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 = @s current_draw

execute as @s[tag=o_can_use,tag=o_using] run scoreboard players operation Temp reg_1 = @s o_current_draw

scoreboard players operation Temp reg_1 /= 10 reg_1