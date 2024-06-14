scoreboard players operation @s reg_2 = @s max_regenerated_strength
scoreboard players operation @s reg_2 *= @s angreal_level

scoreboard players operation @s reg_1 = @s regenerated_strength
scoreboard players operation @s reg_1 *= 10 reg_1
scoreboard players operation @s reg_1 /= @s reg_2

scoreboard players operation @s reg_3 = @s current_held
scoreboard players operation @s reg_3 /= 10 reg_1

title @s[scores={reg_1=0}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |","color":"gold"},{"text":"|||||||||","color":"white"}]
title @s[scores={reg_1=1}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||","color":"gold"},{"text":"||||||||","color":"white"}]
title @s[scores={reg_1=2}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||","color":"gold"},{"text":"|||||||","color":"white"}]
title @s[scores={reg_1=3}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||","color":"gold"},{"text":"||||||","color":"white"}]
title @s[scores={reg_1=4}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||","color":"gold"},{"text":"|||||","color":"white"}]
title @s[scores={reg_1=5}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||","color":"gold"},{"text":"||||","color":"white"}]
title @s[scores={reg_1=6}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||||","color":"gold"},{"text":"|||","color":"white"}]
title @s[scores={reg_1=7}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||||","color":"gold"},{"text":"||","color":"white"}]
title @s[scores={reg_1=8}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" |||||||||","color":"gold"},{"text":"|","color":"white"}]
title @s[scores={reg_1=9..}] actionbar ["",{"score":{"name":"@s","objective":"reg_3"},"color":"gold"},{"text":" ||||||||||","color":"gold"}]