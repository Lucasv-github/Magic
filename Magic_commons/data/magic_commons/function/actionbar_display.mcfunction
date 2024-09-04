scoreboard players operation @s reg_2 = @s max_regenerated_strength
scoreboard players operation @s reg_2 *= @s angreal_level

scoreboard players operation @s reg_1 = @s regenerated_strength
scoreboard players operation @s reg_1 *= 10 reg_1
scoreboard players operation @s reg_1 /= @s reg_2

scoreboard players operation @s reg_3 = @s current_held
scoreboard players operation @s reg_3 /= 10 reg_1

title @s[scores={reg_1=0},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |","color":"gold"},{"text":"|||||||||","color":"white"}]
title @s[scores={reg_1=1},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||","color":"gold"},{"text":"||||||||","color":"white"}]
title @s[scores={reg_1=2},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||","color":"gold"},{"text":"|||||||","color":"white"}]
title @s[scores={reg_1=3},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||","color":"gold"},{"text":"||||||","color":"white"}]
title @s[scores={reg_1=4},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||","color":"gold"},{"text":"|||||","color":"white"}]
title @s[scores={reg_1=5},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||","color":"gold"},{"text":"||||","color":"white"}]
title @s[scores={reg_1=6},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||||","color":"gold"},{"text":"|||","color":"white"}]
title @s[scores={reg_1=7},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||||","color":"gold"},{"text":"||","color":"white"}]
title @s[scores={reg_1=8},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||||||","color":"gold"},{"text":"|","color":"white"}]
title @s[scores={reg_1=9..},tag=using,tag=can_use] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||||||","color":"gold"}]