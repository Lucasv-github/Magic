#Temp reg_1 = 0: Don't tellraw
scoreboard players operation Temp reg_4 = Temp reg_1

data merge storage magic:print_weave_composition_build {text:[]}

execute store result storage magic:print_weave_composition_iteration index int 1 run scoreboard players get @s player_weave_index
execute store result storage magic:print_weave_composition_iteration i int 1 run scoreboard players get 0 reg_1
execute store result storage magic:print_weave_composition_iteration x int 1 run scoreboard players get 0 reg_1
execute store result storage magic:print_weave_composition_iteration y int 1 run scoreboard players get 2 reg_1

execute unless score Temp reg_4 matches 0 at @s[tag=inverted] run tellraw @a[tag=can_see,tag=truly_see] {"text":"...","color":"gold"}

function magic:display/print_weave_composition_iteration with storage magic:print_weave_composition_iteration

