#Will not touch the playerbound registers
scoreboard players set Temp reg_1 0
execute as @s[tag=can_use,tag=using] run function magic:magic_actions/get_total_current_drain

scoreboard players operation Temp reg_1 /= 10 reg_1