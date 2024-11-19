scoreboard players operation @s reg_2 = @s max_regenerated_strength
#magic:power_handling/tap_power already does this so no reason to do this twice
#scoreboard players operation @s reg_2 *= @s angreal_level

scoreboard players operation @s reg_1 = @s regenerated_strength
scoreboard players operation @s reg_1 *= 10 reg_1
scoreboard players operation @s reg_1 /= @s reg_2

scoreboard players operation @s reg_3 = @s current_held
scoreboard players operation @s reg_3 /= 10 reg_1

tag @s[tag=using] add actionbar_display_temp
tag @s[tag=circled] add actionbar_display_temp

title @s[scores={reg_1=0},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |","color":"gold"},{"text":"|||||||||","color":"white"}]
title @s[scores={reg_1=1},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||","color":"gold"},{"text":"||||||||","color":"white"}]
title @s[scores={reg_1=2},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||","color":"gold"},{"text":"|||||||","color":"white"}]
title @s[scores={reg_1=3},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||","color":"gold"},{"text":"||||||","color":"white"}]
title @s[scores={reg_1=4},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||","color":"gold"},{"text":"|||||","color":"white"}]
title @s[scores={reg_1=5},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||","color":"gold"},{"text":"||||","color":"white"}]
title @s[scores={reg_1=6},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||||","color":"gold"},{"text":"|||","color":"white"}]
title @s[scores={reg_1=7},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||||","color":"gold"},{"text":"||","color":"white"}]
title @s[scores={reg_1=8},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||||||","color":"gold"},{"text":"|","color":"white"}]
title @s[scores={reg_1=9..},tag=actionbar_display_temp,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||||||","color":"gold"}]

tag @s remove actionbar_display_temp