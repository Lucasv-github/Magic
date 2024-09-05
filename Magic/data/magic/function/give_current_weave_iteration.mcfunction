scoreboard players set Temp reg_1 0
$execute store result score Temp reg_1 run data get storage magic:weave_$(index) Elements[$(i)]

#Add to i
$scoreboard players set Temp reg_2 $(i)
scoreboard players add Temp reg_2 1
execute store result storage magic:give_current_weave_iteration i int 1 run scoreboard players get Temp reg_2

execute if score Temp reg_1 matches 1 run data modify storage magic:give_current_weave_build text append value '{"text":"\\uE000"}'
execute if score Temp reg_1 matches 2 run data modify storage magic:give_current_weave_build text append value '{"text":"\\uE001"}'
execute if score Temp reg_1 matches 3 run data modify storage magic:give_current_weave_build text append value '{"text":"\\uE002"}'
execute if score Temp reg_1 matches 4 run data modify storage magic:give_current_weave_build text append value '{"text":"\\uE003"}'
execute if score Temp reg_1 matches 5 run data modify storage magic:give_current_weave_build text append value '{"text":"\\uE004"}'

execute if score Temp reg_3 matches 0..1 if score Temp reg_1 matches -1..0 in minecraft:overworld run setblock 0 0 0 oak_sign{front_text:{messages:['{"nbt":"text[]","storage":"magic:give_current_weave_build","interpret":true,"separator":"","color":"white"}','{"text":""}','{"text":""}','{"text":""}']}} destroy

execute if score Temp reg_3 matches 0 if score Temp reg_1 matches -1..0 run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:lore append from block 0 0 0 front_text.messages[0]

execute if score Temp reg_3 matches 1 if score Temp reg_1 matches -1..0 run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_name set from block 0 0 0 front_text.messages[0]
execute if score Temp reg_3 matches 1 if score Temp reg_1 matches -1..0 run scoreboard players set Temp reg_3 0

#Clean for next
execute if score Temp reg_1 matches -1..0 run data merge storage magic:give_current_weave_build {text:[]}

execute unless score Temp reg_1 matches 0 run function magic:weave_handling/give_current_weave_iteration with storage magic:give_current_weave_iteration