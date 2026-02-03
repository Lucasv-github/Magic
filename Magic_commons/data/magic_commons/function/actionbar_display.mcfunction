tag @s[tag=using] add actionbar_display_temp
tag @s[tag=o_using] add actionbar_display_temp

tag @s[tag=circled] add actionbar_display_circle_temp
tag @s[tag=circled] add actionbar_display_temp
tag @s[tag=o_circled] add actionbar_display_circle_temp
tag @s[tag=o_circled] add actionbar_display_temp

#Bail if nothing
execute as @s[tag=!actionbar_display_temp] run return 0

#Bar start
data merge storage magic:give_current_weave_build {text:[]}

function magic_commons:create_strength_bar
execute as @s[tag=!actionbar_display_circle_temp] run function magic_commons:create_power_bar

title @s[tag=actionbar_display_temp] actionbar {nbt:"text",storage:"magic_commons:actionbar",interpret:true,font:"magic_resourcepack:gui_font"}

#Bar cleanup
data remove storage magic_commons:actionbar text

tag @s remove actionbar_display_circle_temp
tag @s remove actionbar_display_temp