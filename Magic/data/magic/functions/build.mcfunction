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

tag @s add built

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{Force:1}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:1,display:{Name:'[{"text":"Air","italic":false,"color":"aqua"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:1} 1

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{Force:2}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:2,display:{Name:'[{"text":"Earth","italic":false,"color":"dark_green"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:2} 1

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{Force:3}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:3,display:{Name:'[{"text":"Fire","italic":false,"color":"red"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:3} 1

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{Force:4}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:4,display:{Name:'[{"text":"Water","italic":false,"color":"dark_blue"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:4} 1

execute as @s unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{Force:5}}]}] run give @s[scores={use_items=1}] minecraft:carrot_on_a_stick{CustomModelData:5,display:{Name:'[{"text":"Spirit","italic":false,"color":"white"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:5} 1

scoreboard players add @s stage 1

function magic:calculate_distance

execute as @s[scores={reg_1=1, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":" ###","color":"aqua"}]
execute as @s[scores={reg_1=2, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":" ###","color":"dark_green"}]
execute as @s[scores={reg_1=3, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":": ###","color":"red"}]
execute as @s[scores={reg_1=4, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":" ###","color":"dark_blue"}]
execute as @s[scores={reg_1=5, invert=0}] run tellraw @a[tag=can_see,tag=truly_see]  ["",{"selector":"@s","color":"gold"},{"text":": ","color":"gold"},{"score":{"name":"@s","objective":"stage"}},{"text":" ###","color":"white"}]

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


#tellraw @s ["",{"text":"###","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger a set 1"}},{"text":" ","color":"aqua"},{"text":"###","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger e set 2"}},{"text":" ","color":"dark_green"},{"text":"###","color":"red","clickEvent":{"action":"run_command","value":"/trigger f set 3"}},{"text":" ","color":"red"},{"text":"###","color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger w set 4"}},{"text":" ","color":"dark_blue"},{"text":"###","clickEvent":{"action":"run_command","value":"/trigger s set 5"}},{"text":" "},{"text":"->","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 1"}},{"text":" ","color":"black"},{"text":"[]","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 2"}},{"text":" ","color":"black"},{"text":"X","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 4"}},{"text":" ","color":"black"},{"text":"<-","color":"black","clickEvent":{"action":"run_command","value":"/trigger state set 3"}}]

tellraw @s ["",{"text":"###","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger a set 1"}},{"text":" ","color":"aqua"},{"text":"###","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger e set 2"}},{"text":" ","color":"dark_green"},{"text":"###","color":"red","clickEvent":{"action":"run_command","value":"/trigger f set 3"}},{"text":" ","color":"red"},{"text":"###","color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger w set 4"}},{"text":" ","color":"dark_blue"},{"text":"###","clickEvent":{"action":"run_command","value":"/trigger s set 5"}},{"text":" "}]

#Remove old if not in same slot (deprecated)
#clear @s minecraft:enchanted_book{Magic_temp_weave:1,Force:8}
function magic:give_current_weave

scoreboard players remove @s current_held 10
#Lost hold of it
execute as @s[scores={current_held=..0}] run function magic:exit

scoreboard players set @s click 0