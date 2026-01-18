function magic_commons:hooks/get_regenerated_strength
scoreboard players operation @s reg_1 = Temp reg_1

function magic_commons:hooks/get_current_draw
scoreboard players operation @s reg_2 = Temp reg_1

function magic_commons:hooks/get_current_drain
scoreboard players operation @s reg_3 = Temp reg_1

tag @s[tag=using] add actionbar_display_temp
tag @s[tag=o_using] add actionbar_display_temp

tag @s[tag=circled] add actionbar_display_circle_temp
tag @s[tag=circled] add actionbar_display_temp
tag @s[tag=o_circled] add actionbar_display_circle_temp
tag @s[tag=o_circled] add actionbar_display_temp

title @s[scores={reg_1=0},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" |","color":"gold"},{"text":"|||||||||","color":"white"}]
title @s[scores={reg_1=1},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" ||","color":"gold"},{"text":"||||||||","color":"white"}]
title @s[scores={reg_1=2},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" |||","color":"gold"},{"text":"|||||||","color":"white"}]
title @s[scores={reg_1=3},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" ||||","color":"gold"},{"text":"||||||","color":"white"}]
title @s[scores={reg_1=4},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" |||||","color":"gold"},{"text":"|||||","color":"white"}]
title @s[scores={reg_1=5},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" ||||||","color":"gold"},{"text":"||||","color":"white"}]
title @s[scores={reg_1=6},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" |||||||","color":"gold"},{"text":"|||","color":"white"}]
title @s[scores={reg_1=7},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" ||||||||","color":"gold"},{"text":"||","color":"white"}]
title @s[scores={reg_1=8},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"}, "color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" |||||||||","color":"gold"},{"text":"|","color":"white"}]
title @s[scores={reg_1=9..},tag=actionbar_display_temp] actionbar ["",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_2"},"color":"dark_green"}," ",{"score":{"name":"@s[tag=!actionbar_display_circle_temp]","objective":"reg_3"}, "color":"dark_red"},{"text":" ||||||||||","color":"gold"}]


tag @s remove actionbar_display_circle_temp
tag @s remove actionbar_display_temp