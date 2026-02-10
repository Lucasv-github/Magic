function magic_commons:hooks/get_current_draw
execute if score Temp reg_1 matches 10.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 100.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 1000.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 10000.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 100000.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 1000000.. run data modify storage magic_commons:actionbar text append value "\uF006"

function magic_commons:hooks/get_current_drain
execute if score Temp reg_1 matches 10.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 100.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 1000.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 10000.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 100000.. run data modify storage magic_commons:actionbar text append value "\uF006"
execute if score Temp reg_1 matches 1000000.. run data modify storage magic_commons:actionbar text append value "\uF006"

function magic_commons:hooks/get_regenerated_strength_percentage
scoreboard players operation @s reg_1 = Temp reg_1

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