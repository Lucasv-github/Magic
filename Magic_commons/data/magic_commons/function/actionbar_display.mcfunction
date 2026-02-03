tag @s[tag=using] add actionbar_display_temp
tag @s[tag=o_using] add actionbar_display_temp

tag @s[tag=circled] add actionbar_display_circle_temp
tag @s[tag=circled] add actionbar_display_temp
tag @s[tag=o_circled] add actionbar_display_circle_temp
tag @s[tag=o_circled] add actionbar_display_temp

#Bail if nothing
execute as @s[tag=!actionbar_display_temp] run return 0

function magic_commons:create_strength_bar

#When not circle member
execute as @s[tag=!actionbar_display_circle_temp] run function magic_commons:create_power_bar

execute as @s[tag=!actionbar_display_circle_temp] run function magic_commons:hooks/get_current_draw
scoreboard players operation @s reg_1 = Temp reg_1

execute as @s[tag=!actionbar_display_circle_temp] run function magic_commons:hooks/get_current_drain

title @s[tag=!actionbar_display_circle_temp] actionbar ["",{nbt:"text",storage:"magic_commons:actionbar",interpret:true,font:"magic_resourcepack:gui_font"},{text:" ↑",color:"dark_red"}, {score:{name:"@s",objective:"reg_1"},color:"dark_red"},{text:" ↓",color:"dark_blue"}, {score:{name:"Temp",objective:"reg_1"},color:"dark_blue"}]

#Circle member fallback
title @s[tag=actionbar_display_circle_temp] actionbar {nbt:"text",storage:"magic_commons:actionbar",interpret:true,font:"magic_resourcepack:gui_font"}

#Bar cleanup
data remove storage magic_commons:actionbar text

tag @s remove actionbar_display_circle_temp
tag @s remove actionbar_display_temp