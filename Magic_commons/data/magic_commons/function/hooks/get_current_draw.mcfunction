#Will not touch the playerbound registers

execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 = @s current_draw
execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 /= 10 reg_1