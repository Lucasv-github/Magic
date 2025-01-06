execute at @s run summon minecraft:chest_minecart ~ ~ ~ {CustomName:'{"text":"give_current_weave"}', Invulnerable:1b, Tags:["give_current_weave"], NoGravity:1}
item replace entity @e[limit=1,sort=nearest, tag=give_current_weave] container.0 with minecraft:carrot_on_a_stick[custom_data={Magic:8,Player_weave_index:0},custom_name='["",{"text":"Weave","italic":false,"color":"dark_purple"}]',enchantment_glint_override=1b,lore=[],minecraft:custom_model_data=10]

execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.Player_weave_index int 1.0 run scoreboard players get @s player_weave_index

#execute store result score Temp reg_1 run clear @s carrot_on_a_stick[custom_data~{Magic:8}] 0
#scoreboard players operation Temp reg_1 = @s player_weave_index

data merge storage magic:give_current_weave_build {text:[]}

execute store result storage magic:give_current_weave_iteration index int 1 run scoreboard players get @s player_weave_index
execute store result storage magic:give_current_weave_iteration i int 1 run scoreboard players get 0 reg_1

#Use name
scoreboard players set Temp reg_3 1
function magic:weave_handling/give_current_weave_iteration with storage magic:give_current_weave_iteration

#Custom datas:
#1:
#10 Air
#11 Earth
#12 Fire
#13 Water
#14 Spirit

#2:
#15 Air+Earth
#16 Air+Fire
#17 Air+Water
#18 Air+Spirit

#19 Earth+Fire
#20 Earth+Water
#21 Earth+Spirit

#22 Fire+Water
#23 Fire+Spirit

#24 Water+Spirit

#3:
#25 Air+Earth+Fire
#26 Air+Earth+Water
#27 Air+Earth+Spirit

#28 Air+Fire+Water
#29 Air+Fire+Spirit
#30 Air+Water+Spirit

#31 Earth+Fire+Water
#32 Earth+Fire+Spirit
#33 Earth+Water+Spirit

#34 Fire+Water+Spirit

#4:
#35 Air+Earth+Fire+Water
#36 Air+Earth+Fire+Spirit
#37 Air+Earth+Water+Spirit
#38 Air+Fire+Water+Spirit
#39 Earth+Fire+Water+Spirit

#5:
#40 Air+Earth+Fire+Water+Spirit

#This is pretty horrendous
execute as @s[tag=w_a_t,tag=!w_e_t,tag=!w_f_t,tag=!w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 10
execute as @s[tag=!w_a_t,tag=w_e_t,tag=!w_f_t,tag=!w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 11
execute as @s[tag=!w_a_t,tag=!w_e_t,tag=w_f_t,tag=!w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 12
execute as @s[tag=!w_a_t,tag=!w_e_t,tag=!w_f_t,tag=w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 13
execute as @s[tag=!w_a_t,tag=!w_e_t,tag=!w_f_t,tag=!w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 14

execute as @s[tag=w_a_t,tag=w_e_t,tag=!w_f_t,tag=!w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 15
execute as @s[tag=w_a_t,tag=!w_e_t,tag=w_f_t,tag=!w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 16
execute as @s[tag=w_a_t,tag=!w_e_t,tag=!w_f_t,tag=w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 17
execute as @s[tag=w_a_t,tag=!w_e_t,tag=!w_f_t,tag=!w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 18
execute as @s[tag=!w_a_t,tag=w_e_t,tag=w_f_t,tag=!w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 19
execute as @s[tag=!w_a_t,tag=w_e_t,tag=!w_f_t,tag=w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 20
execute as @s[tag=!w_a_t,tag=w_e_t,tag=!w_f_t,tag=!w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 21
execute as @s[tag=!w_a_t,tag=!w_e_t,tag=w_f_t,tag=w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 22
execute as @s[tag=!w_a_t,tag=!w_e_t,tag=w_f_t,tag=!w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 23
execute as @s[tag=!w_a_t,tag=!w_e_t,tag=!w_f_t,tag=w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 24

execute as @s[tag=w_a_t,tag=w_e_t,tag=w_f_t,tag=!w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 25
execute as @s[tag=w_a_t,tag=w_e_t,tag=!w_f_t,tag=w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 26
execute as @s[tag=w_a_t,tag=w_e_t,tag=!w_f_t,tag=!w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 27
execute as @s[tag=w_a_t,tag=!w_e_t,tag=w_f_t,tag=w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 28
execute as @s[tag=w_a_t,tag=!w_e_t,tag=w_f_t,tag=!w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 29
execute as @s[tag=w_a_t,tag=!w_e_t,tag=!w_f_t,tag=w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 30
execute as @s[tag=!w_a_t,tag=w_e_t,tag=w_f_t,tag=w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 31
execute as @s[tag=!w_a_t,tag=w_e_t,tag=w_f_t,tag=!w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 32
execute as @s[tag=!w_a_t,tag=w_e_t,tag=!w_f_t,tag=w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 33
execute as @s[tag=!w_a_t,tag=!w_e_t,tag=w_f_t,tag=w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 34

execute as @s[tag=w_a_t,tag=w_e_t,tag=w_f_t,tag=w_w_t,tag=!w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 35
execute as @s[tag=w_a_t,tag=w_e_t,tag=w_f_t,tag=!w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 36
execute as @s[tag=w_a_t,tag=w_e_t,tag=!w_f_t,tag=w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 37
execute as @s[tag=w_a_t,tag=!w_e_t,tag=w_f_t,tag=w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 38
execute as @s[tag=!w_a_t,tag=w_e_t,tag=w_f_t,tag=w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 39

execute as @s[tag=w_a_t,tag=w_e_t,tag=w_f_t,tag=w_w_t,tag=w_s_t] run data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_model_data set value 40

tag @s remove w_a_t
tag @s remove w_e_t
tag @s remove w_f_t
tag @s remove w_w_t
tag @s remove w_s_t

#Move out item if present in slot 8 but do NOT move out a weave, just destroy that else remove cleanup will f and oh boy
execute at @s[nbt={Inventory:[{Slot:8b}]}] unless data entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"move_slot_8"}', Invulnerable:1b, Tags:["move_slot_8"], NoGravity:1}
execute at @s[nbt={Inventory:[{Slot:8b}]}] unless data entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index run item replace entity @e[tag=move_slot_8,sort=nearest,limit=1] container.0 from entity @s hotbar.8
kill @e[tag=move_slot_8]

item replace entity @s hotbar.8 from entity @e[limit=1,sort=nearest, tag=give_current_weave] container.0

#Prevent dropped item which would f remove cleanup player single
item replace entity @e[sort=nearest, tag=give_current_weave] container.0 with minecraft:air
kill @e[sort=nearest, tag=give_current_weave]
