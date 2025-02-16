#Will not touch the playerbound registers

execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 = @s regenerated_strength
execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 *= 10 reg_1
execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_2 = @s max_regenerated_strength
execute as @s[tag=can_use,tag=using] run scoreboard players operation Temp reg_1 /= Temp reg_2

execute as @s[tag=can_use,tag=circled] run scoreboard players operation Temp reg_1 = @s regenerated_strength
execute as @s[tag=can_use,tag=circled] run scoreboard players operation Temp reg_1 *= 10 reg_1
execute as @s[tag=can_use,tag=circled] run scoreboard players operation Temp reg_2 = @s max_regenerated_strength
execute as @s[tag=can_use,tag=circled] run scoreboard players operation Temp reg_1 /= Temp reg_2

execute as @s[tag=o_can_use,tag=o_using] run scoreboard players operation Temp reg_1 = @s o_regenerated_strength
execute as @s[tag=o_can_use,tag=o_using] run scoreboard players operation Temp reg_1 *= 10 reg_1
execute as @s[tag=o_can_use,tag=o_using] run scoreboard players operation Temp reg_2 = @s o_max_regenerated_strength
execute as @s[tag=o_can_use,tag=o_using] run scoreboard players operation Temp reg_1 /= Temp reg_2

execute as @s[tag=o_can_use,tag=o_circled] run scoreboard players operation Temp reg_1 = @s o_regenerated_strength
execute as @s[tag=o_can_use,tag=o_circled] run scoreboard players operation Temp reg_1 *= 10 reg_1
execute as @s[tag=o_can_use,tag=o_circled] run scoreboard players operation Temp reg_2 = @s o_max_regenerated_strength
execute as @s[tag=o_can_use,tag=o_circled] run scoreboard players operation Temp reg_1 /= Temp reg_2