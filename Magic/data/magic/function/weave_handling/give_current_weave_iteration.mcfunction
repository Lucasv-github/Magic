################################################################################
#Purpose: Add weave element corresponding to index $(i) to name or lore from weave data specified by $(index), then run itself with increased $(i)
#Runner: A player whose weave item is getting constructed, via weave_handling/give_current_weave_iteration.mcfunction or by itself
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players set Temp reg_1 0
$execute store result score Temp reg_1 run data get storage magic:weave_$(index) Elements[$(i)]

#Add to i
$scoreboard players set Temp reg_2 $(i)
scoreboard players add Temp reg_2 1
execute store result storage magic:give_current_weave_iteration i int 1 run scoreboard players get Temp reg_2

execute if score Temp reg_1 matches 1 run data modify storage magic:give_current_weave_build text append value '\uE000'
execute if score Temp reg_1 matches 2 run data modify storage magic:give_current_weave_build text append value '\uE001'
execute if score Temp reg_1 matches 3 run data modify storage magic:give_current_weave_build text append value '\uE002'
execute if score Temp reg_1 matches 4 run data modify storage magic:give_current_weave_build text append value '\uE003'
execute if score Temp reg_1 matches 5 run data modify storage magic:give_current_weave_build text append value '\uE004'

execute if score Temp reg_1 matches 1 run tag @s add w_a_t
execute if score Temp reg_1 matches 2 run tag @s add w_e_t
execute if score Temp reg_1 matches 3 run tag @s add w_f_t
execute if score Temp reg_1 matches 4 run tag @s add w_w_t
execute if score Temp reg_1 matches 5 run tag @s add w_s_t


execute if score Temp reg_3 matches 0 if score Temp reg_1 matches -1..0 run item modify entity @e[limit=1,sort=nearest, tag=give_current_weave] container.0 {function:"set_lore",entity:"this",mode:"append",lore:[{nbt:"text[]",storage:"magic:give_current_weave_build",interpret:true,"separator":"",color:"white",font:"magic_resourcepack:elements"}]}

execute if score Temp reg_3 matches 1 if score Temp reg_1 matches -1..0 run item modify entity @e[limit=1,sort=nearest, tag=give_current_weave] container.0 {function:"set_name",entity:"this",mode:"append",name:[{nbt:"text[]",storage:"magic:give_current_weave_build",interpret:true,"separator":"",color:"white",font:"magic_resourcepack:elements"}]}

execute if score Temp reg_3 matches 1 if score Temp reg_1 matches -1..0 run scoreboard players set Temp reg_3 0

kill @e[type=text_display,tag=temp_weave_name]

#Clean for next
execute if score Temp reg_1 matches -1..0 run data merge storage magic:give_current_weave_build {text:[]}

execute unless score Temp reg_1 matches 0 run function magic:weave_handling/give_current_weave_iteration with storage magic:give_current_weave_iteration