scoreboard players set Temp reg_1 0
$execute store result score Temp reg_1 run data get storage magic:weave_$(index) Elements[$(i)]

#Add to i
$scoreboard players set Temp reg_2 $(i)
scoreboard players add Temp reg_2 1
execute store result storage magic:print_weave_composition_iteration i int 1 run scoreboard players get Temp reg_2

execute if score Temp reg_1 matches 1 run data modify storage magic:print_weave_composition_build text append value '{"text":"\\uE000"}'
execute if score Temp reg_1 matches 2 run data modify storage magic:print_weave_composition_build text append value '{"text":"\\uE001"}'
execute if score Temp reg_1 matches 3 run data modify storage magic:print_weave_composition_build text append value '{"text":"\\uE002"}'
execute if score Temp reg_1 matches 4 run data modify storage magic:print_weave_composition_build text append value '{"text":"\\uE003"}'
execute if score Temp reg_1 matches 5 run data modify storage magic:print_weave_composition_build text append value '{"text":"\\uE004"}'

#The sending
execute if score Temp reg_1 matches 0 at @s[tag=inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":""}
execute if score Temp reg_1 matches 0 at @s[tag=!inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":""}

execute if score Temp reg_1 matches -1 at @s[tag=inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":""}
execute if score Temp reg_1 matches -1 at @s[tag=!inverted] run tellraw @a[tag=can_see,tag=truly_see] {"nbt":"text[]","storage":"magic:print_weave_composition_build","interpret":true,"separator":""}

#Clean for next
execute if score Temp reg_1 matches 0 run data merge storage magic:print_weave_composition_build {text:[]}
execute if score Temp reg_1 matches -1 run data merge storage magic:print_weave_composition_build {text:[]}

execute unless score Temp reg_1 matches 0 run function magic:print_weave_composition_iteration with storage magic:print_weave_composition_iteration