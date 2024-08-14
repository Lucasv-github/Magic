execute at @s run playsound minecraft:entity.item.pickup player @s

scoreboard players set @s reg_1 0

scoreboard players operation @s reg_1 += @s a
scoreboard players operation @s reg_1 += @s e
scoreboard players operation @s reg_1 += @s f
scoreboard players operation @s reg_1 += @s w
scoreboard players operation @s reg_1 += @s s

scoreboard players set @s a 0
scoreboard players set @s e 0
scoreboard players set @s f 0
scoreboard players set @s w 0
scoreboard players set @s s 0

#TODO need unique at times
execute store result storage magic:weave_add_element index int 1 run scoreboard players get @s player_weave_index
function magic:weave_add_element with storage magic:weave_add_element

tag @s add built

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:1}}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Air","italic":false,"color":"aqua"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=1,custom_data={Force:1}] 1

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:2}}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Earth","italic":false,"color":"dark_green"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=2,custom_data={Force:2}] 1

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:3}}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Fire","italic":false,"color":"red"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=3,custom_data={Force:3}] 1

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:4}}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Water","italic":false,"color":"dark_blue"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=4,custom_data={Force:4}] 1

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:5}}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Spirit","italic":false,"color":"white"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],custom_model_data=5,custom_data={Force:5}] 1

scoreboard players add @s stage 1

function magic:calculate_distance

execute as @s[scores={reg_1=1, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":" \uE000","color":"white"}]
execute as @s[scores={reg_1=2, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":" \uE001","color":"white"}]
execute as @s[scores={reg_1=3, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":": \uE002","color":"white"}]
execute as @s[scores={reg_1=4, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":" \uE003","color":"white"}]
execute as @s[scores={reg_1=5, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":" \uE004","color":"white"}]

execute as @s[scores={stage=1}] run scoreboard players operation @s t_1 = @s reg_1
execute as @s[scores={stage=2}] run scoreboard players operation @s t_2 = @s reg_1
execute as @s[scores={stage=3}] run scoreboard players operation @s t_3 = @s reg_1
execute as @s[scores={stage=4}] run scoreboard players operation @s t_4 = @s reg_1
execute as @s[scores={stage=5}] run scoreboard players operation @s t_5 = @s reg_1
execute as @s[scores={stage=6}] run scoreboard players operation @s t_6 = @s reg_1
execute as @s[scores={stage=7}] run scoreboard players operation @s t_7 = @s reg_1
execute as @s[scores={stage=8}] run scoreboard players operation @s t_8 = @s reg_1
execute as @s[scores={stage=9}] run scoreboard players operation @s t_9 = @s reg_1
execute as @s[scores={stage=10}] run scoreboard players operation @s t_10 = @s reg_1
execute as @s[scores={stage=11}] run scoreboard players operation @s t_11 = @s reg_1
execute as @s[scores={stage=12}] run scoreboard players operation @s t_12 = @s reg_1
execute as @s[scores={stage=13}] run scoreboard players operation @s t_13 = @s reg_1
execute as @s[scores={stage=14}] run scoreboard players operation @s t_14 = @s reg_1
execute as @s[scores={stage=15}] run scoreboard players operation @s t_15 = @s reg_1
execute as @s[scores={stage=16}] run scoreboard players operation @s t_16 = @s reg_1
execute as @s[scores={stage=17}] run scoreboard players operation @s t_17 = @s reg_1
execute as @s[scores={stage=18}] run scoreboard players operation @s t_18 = @s reg_1
execute as @s[scores={stage=19}] run scoreboard players operation @s t_19 = @s reg_1
execute as @s[scores={stage=20}] run scoreboard players operation @s t_20 = @s reg_1


tellraw @s ["",{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger a set 1"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger e set 2"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger f set 3"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger w set 4"}},{"text":"  ","clickEvent":{"action":"run_command","value":"/trigger s set 5"}},{"text":" ↑ ","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 1"}}]

#tellraw @s ["",{"text":"###","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger a set 1"}},{"text":" ","color":"aqua"},{"text":"###","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger e set 2"}},{"text":" ","color":"dark_green"},{"text":"###","color":"red","clickEvent":{"action":"run_command","value":"/trigger f set 3"}},{"text":" ","color":"red"},{"text":"###","color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger w set 4"}},{"text":" ","color":"dark_blue"},{"text":"###","clickEvent":{"action":"run_command","value":"/trigger s set 5"}},{"text":" "}]

#Remove old if not in same slot (deprecated)
#clear @s minecraft:carrot_on_a_stick{Magic_temp_weave:1,Force:8}
function magic:give_current_weave

scoreboard players remove @s current_held 10
#Lost hold of it
execute as @s[scores={current_held=..0}] run function magic:exit

scoreboard players set @s click 0