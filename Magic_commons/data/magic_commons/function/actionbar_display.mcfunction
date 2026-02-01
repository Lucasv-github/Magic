function magic_commons:hooks/get_regenerated_strength_percentage
scoreboard players operation @s reg_1 = Temp reg_1

tag @s[tag=using] add actionbar_display_temp
tag @s[tag=o_using] add actionbar_display_temp

tag @s[tag=circled] add actionbar_display_circle_temp
tag @s[tag=circled] add actionbar_display_temp
tag @s[tag=o_circled] add actionbar_display_circle_temp
tag @s[tag=o_circled] add actionbar_display_temp

#Bar start
data merge storage magic:give_current_weave_build {text:[]}

data modify storage magic_commons:actionbar text append value "\uF001\uF002\uF002"

execute if score @s reg_1 matches 1.. run data modify storage magic_commons:actionbar text append value "\uE005\uF002"
execute unless score @s reg_1 matches 1.. run data modify storage magic_commons:actionbar text append value "\uE015\uF002"

execute if score @s reg_1 matches 2.. run data modify storage magic_commons:actionbar text append value "\uE006\uF002"
execute unless score @s reg_1 matches 2.. run data modify storage magic_commons:actionbar text append value "\uE016\uF002"

execute if score @s reg_1 matches 3.. run data modify storage magic_commons:actionbar text append value "\uE007\uF002"
execute unless score @s reg_1 matches 3.. run data modify storage magic_commons:actionbar text append value "\uE017\uF002"

execute if score @s reg_1 matches 4.. run data modify storage magic_commons:actionbar text append value "\uE008\uF002"
execute unless score @s reg_1 matches 4.. run data modify storage magic_commons:actionbar text append value "\uE018\uF002"

execute if score @s reg_1 matches 5.. run data modify storage magic_commons:actionbar text append value "\uE009\uF002"
execute unless score @s reg_1 matches 5.. run data modify storage magic_commons:actionbar text append value "\uE019\uF002"

execute if score @s reg_1 matches 6.. run data modify storage magic_commons:actionbar text append value "\uE010\uF002"
execute unless score @s reg_1 matches 6.. run data modify storage magic_commons:actionbar text append value "\uE020\uF002"

execute if score @s reg_1 matches 7.. run data modify storage magic_commons:actionbar text append value "\uE011\uF002"
execute unless score @s reg_1 matches 7.. run data modify storage magic_commons:actionbar text append value "\uE021\uF002"

execute if score @s reg_1 matches 8.. run data modify storage magic_commons:actionbar text append value "\uE012\uF002"
execute unless score @s reg_1 matches 8.. run data modify storage magic_commons:actionbar text append value "\uE022\uF002"

execute if score @s reg_1 matches 9.. run data modify storage magic_commons:actionbar text append value "\uE013\uF002"
execute unless score @s reg_1 matches 9.. run data modify storage magic_commons:actionbar text append value "\uE023\uF002"

execute if score @s reg_1 matches 10.. run data modify storage magic_commons:actionbar text append value "\uE014\uF002"
execute unless score @s reg_1 matches 10.. run data modify storage magic_commons:actionbar text append value "\uE024\uF002"


#Backtrace for next bar
data modify storage magic_commons:actionbar text append value "\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002\uF002"

function magic_commons:hooks/get_draw_percentage
scoreboard players operation @s reg_1 = Temp reg_1

function magic_commons:hooks/get_drain_percentage
scoreboard players operation @s reg_2 = Temp reg_1

data modify storage magic_commons:actionbar text append value "\uF003"

execute unless score @s reg_2 matches 1.. if score @s reg_1 matches 1.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 1.. unless score @s reg_1 matches 1.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 1.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 2.. if score @s reg_1 matches 2.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 2.. unless score @s reg_1 matches 2.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 2.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 3.. if score @s reg_1 matches 3.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 3.. unless score @s reg_1 matches 3.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 3.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 4.. if score @s reg_1 matches 4.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 4.. unless score @s reg_1 matches 4.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 4.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 5.. if score @s reg_1 matches 5.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 5.. unless score @s reg_1 matches 5.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 5.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 6.. if score @s reg_1 matches 6.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 6.. unless score @s reg_1 matches 6.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 6.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 7.. if score @s reg_1 matches 7.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 7.. unless score @s reg_1 matches 7.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 7.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 8.. if score @s reg_1 matches 8.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 8.. unless score @s reg_1 matches 8.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 8.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 9.. if score @s reg_1 matches 9.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 9.. unless score @s reg_1 matches 9.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 9.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

execute unless score @s reg_2 matches 10.. if score @s reg_1 matches 10.. run data modify storage magic_commons:actionbar text append value "\uE025\uF002"
execute unless score @s reg_2 matches 10.. unless score @s reg_1 matches 10.. run data modify storage magic_commons:actionbar text append value "\uE027\uF002"
execute if score @s reg_2 matches 10.. run data modify storage magic_commons:actionbar text append value "\uE026\uF002"

title @s[tag=actionbar_display_temp] actionbar {nbt:"text",storage:"magic_commons:actionbar",interpret:true,font:"magic_resourcepack:gui_font"}

#Bar cleanup
data remove storage magic_commons:actionbar text

tag @s remove actionbar_display_circle_temp
tag @s remove actionbar_display_temp