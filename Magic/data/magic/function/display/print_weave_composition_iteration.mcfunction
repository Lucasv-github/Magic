################################################################################
#Purpose: Iterate through weave data denoted by $(index), with index of $(i) and display(relative pos $(x), $(y))+chatsend each previous weave line once the next line separator is reach
#Runner: An armorstand holding a weave, via display/print_weave_composition.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players set Temp reg_1 0
$execute store result score Temp reg_1 run data get storage magic:weave_$(index) Elements[$(i)]

#Add to i
$scoreboard players set Temp reg_2 $(i)
scoreboard players add Temp reg_2 1
execute store result storage magic:print_weave_composition_iteration i int 1 run scoreboard players get Temp reg_2

execute if score Temp reg_1 matches 1 run data modify storage magic:print_weave_composition_build text append value '\uE000'
execute if score Temp reg_1 matches 2 run data modify storage magic:print_weave_composition_build text append value '\uE001'
execute if score Temp reg_1 matches 3 run data modify storage magic:print_weave_composition_build text append value '\uE002'
execute if score Temp reg_1 matches 4 run data modify storage magic:print_weave_composition_build text append value '\uE003'
execute if score Temp reg_1 matches 5 run data modify storage magic:print_weave_composition_build text append value '\uE004'

#TODO better x and y pos
$execute if score Temp reg_1 matches 1 at @s run particle minecraft:dust{color:[0.3254,0.9804,0.9804], scale:1} ~ ~$(y) ~$(x) 0 0 0 0 10 normal @a[tag=can_see,tag=truly_see]
$execute if score Temp reg_1 matches 2 at @s run particle minecraft:dust{color:[0.0,0.6431,0.004], scale:1} ~ ~$(y) ~$(x) 0 0 0 0 10 normal @a[tag=can_see,tag=truly_see]
$execute if score Temp reg_1 matches 3 at @s run particle minecraft:dust{color:[1.0,0.3373,0.3373], scale:1} ~ ~$(y) ~$(x) 0 0 0 0 10 normal @a[tag=can_see,tag=truly_see]
$execute if score Temp reg_1 matches 4 at @s run particle minecraft:dust{color:[0.0,0.0,0.7294], scale:1} ~ ~$(y) ~$(x) 0 0 0 0 10 normal @a[tag=can_see,tag=truly_see]
$execute if score Temp reg_1 matches 5 at @s run particle minecraft:dust{color:[1.0,1.0,1.0], scale:1} ~ ~$(y) ~$(x) 0 0 0 0 10 normal @a[tag=can_see,tag=truly_see]

#The sending
execute unless score Temp reg_4 matches 0 if score Temp reg_1 matches 0 at @s[tag=inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":"","font":"magic_resourcepack:gui_font"}
execute unless score Temp reg_4 matches 0 if score Temp reg_1 matches 0 at @s[tag=!inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":"","font":"magic_resourcepack:gui_font"}

execute unless score Temp reg_4 matches 0 if score Temp reg_1 matches -1 at @s[tag=inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":"","font":"magic_resourcepack:gui_font"}
execute unless score Temp reg_4 matches 0 if score Temp reg_1 matches -1 at @s[tag=!inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":"","font":"magic_resourcepack:gui_font"}

execute if score Temp reg_1 matches 0 if score magic_settings magic_debug_weave_state matches 2 run function magic:debug/console_write_composition
execute if score Temp reg_1 matches -1 if score magic_settings magic_debug_weave_state matches 2 run function magic:debug/console_write_composition

#Clean for next
execute if score Temp reg_1 matches 0 run data merge storage magic:print_weave_composition_build {text:[]}
execute if score Temp reg_1 matches -1 run data merge storage magic:print_weave_composition_build {text:[]}

#Particle position values
#X adding
$scoreboard players set Temp reg_3 $(x)
scoreboard players add Temp reg_3 1
execute store result storage magic:print_weave_composition_iteration x int 1 run scoreboard players get Temp reg_3

#Y adding
$execute if score Temp reg_1 matches 0 run scoreboard players set Temp reg_3 $(y)
$execute if score Temp reg_1 matches -1 run scoreboard players set Temp reg_3 $(y)

execute if score Temp reg_1 matches 0 run scoreboard players add Temp reg_3 1
execute if score Temp reg_1 matches -1 run scoreboard players add Temp reg_3 1

execute if score Temp reg_1 matches 0 store result storage magic:print_weave_composition_iteration y int 1 run scoreboard players get Temp reg_3
execute if score Temp reg_1 matches -1 store result storage magic:print_weave_composition_iteration y int 1 run scoreboard players get Temp reg_3

#X reset
execute if score Temp reg_1 matches 0 store result storage magic:print_weave_composition_iteration x int 1 run scoreboard players get 0 reg_1
execute if score Temp reg_1 matches -1 store result storage magic:print_weave_composition_iteration x int 1 run scoreboard players get 0 reg_1

execute unless score Temp reg_4 matches 0 if score Temp reg_1 matches 0 at @s[tag=inverted] run tellraw @a[tag=can_see,tag=truly_see] {"text":"...","color":"gold"}
execute unless score Temp reg_1 matches 0 run function magic:display/print_weave_composition_iteration with storage magic:print_weave_composition_iteration