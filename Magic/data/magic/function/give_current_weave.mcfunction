execute at @s run summon minecraft:chest_minecart ~ ~ ~ {CustomName:'{"text":"give_current_weave"}', Invulnerable:1b, Tags:["give_current_weave"], NoGravity:1}
item replace entity @e[limit=1,sort=nearest, tag=give_current_weave] container.0 with minecraft:carrot_on_a_stick[custom_data={Force:8,Player_weave_index:0,T_1:0,T_2:0,T_3:0,T_4:0,T_5:0,T_6:0,T_7:0,T_8:0,T_9:0,T_10:0,T_11:0,T_12:0,T_13:0,T_14:0,T_15:0,T_16:0,T_17:0,T_18:0,T_19:0,T_20:0},custom_name='["",{"text":"Weave","italic":false,"color":"dark_purple"}]',enchantment_glint_override=1b]

execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.Player_weave_index int 1.0 run scoreboard players get @s player_weave_index

execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_1 int 1.0 run scoreboard players get @s t_1
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_2 int 1.0 run scoreboard players get @s t_2
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_3 int 1.0 run scoreboard players get @s t_3
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_4 int 1.0 run scoreboard players get @s t_4
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_5 int 1.0 run scoreboard players get @s t_5
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_6 int 1.0 run scoreboard players get @s t_6
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_7 int 1.0 run scoreboard players get @s t_7
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_8 int 1.0 run scoreboard players get @s t_8
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_9 int 1.0 run scoreboard players get @s t_9
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_10 int 1.0 run scoreboard players get @s t_10
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_11 int 1.0 run scoreboard players get @s t_11
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_12 int 1.0 run scoreboard players get @s t_12
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_13 int 1.0 run scoreboard players get @s t_13
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_14 int 1.0 run scoreboard players get @s t_14
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_15 int 1.0 run scoreboard players get @s t_15
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_16 int 1.0 run scoreboard players get @s t_16
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_17 int 1.0 run scoreboard players get @s t_17
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_18 int 1.0 run scoreboard players get @s t_18
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_19 int 1.0 run scoreboard players get @s t_19
execute store result entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_data.T_20 int 1.0 run scoreboard players get @s t_20

#execute store result score Temp reg_1 run clear @s carrot_on_a_stick[custom_data~{Force:8}] 0
scoreboard players operation Temp reg_1 = @s player_weave_index

function magic:get_composition
execute in minecraft:overworld run setblock 0 0 0 oak_sign{front_text:{messages:['{"nbt":"text[]","storage":"minecraft:print_composition","interpret":true,"separator":""}','{"text":""}','{"text":""}','{"text":""}']}} destroy
data modify entity @e[limit=1,sort=nearest, tag=give_current_weave] Items[0].components.minecraft:custom_name set from block 0 0 0 front_text.messages[0]

#Move out item if present in slot 8 but do NOT move out a weave, just destroy that else remove cleanup will f and oh boy
execute at @s[nbt={Inventory:[{Slot:8b}]}] unless data entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Force run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"move_slot_8"}', Invulnerable:1b, Tags:["move_slot_8"], NoGravity:1}
execute at @s[nbt={Inventory:[{Slot:8b}]}] unless data entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Force run item replace entity @e[tag=move_slot_8,sort=nearest,limit=1] container.0 from entity @s hotbar.8
kill @e[tag=move_slot_8]

item replace entity @s hotbar.8 from entity @e[limit=1,sort=nearest, tag=give_current_weave] container.0

#Prevent dropped item which would f remove cleanup player single
item replace entity @e[limit=1,sort=nearest, tag=give_current_weave] container.0 with minecraft:air
kill @e[limit=1,sort=nearest, tag=give_current_weave]
