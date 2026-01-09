################################################################################
#Purpose: Set @s reg_1 based on per element scorboards and give back weave build items if missing
#Runner: An entity using magic that has a nonzero element scorboard (a, e, f, w, s), run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Can only add element to weave in slot 9
#Offloading some stuff here to improve add_element's performance due to it running from build

scoreboard players set @s reg_1 0

execute as @s[scores={a=1..}] run scoreboard players set @s reg_1 1
execute as @s[scores={e=1..}] run scoreboard players set @s reg_1 2
execute as @s[scores={f=1..}] run scoreboard players set @s reg_1 3
execute as @s[scores={w=1..}] run scoreboard players set @s reg_1 4
execute as @s[scores={s=1..}] run scoreboard players set @s reg_1 5

#New lines currently not handled from here but that should probably be done, thus deprecating add_line <- TODO

#Refill if player has used up item
execute unless data entity @s[scores={a=1..}] {Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:1}}}]} run give @s[scores={use_items=1..2}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Air","italic":false,"color":"aqua"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:air",custom_data={Magic:1}] 1
execute unless data entity @s[scores={e=1..}] {Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:2}}}]} run give @s[scores={use_items=1..2}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Earth","italic":false,"color":"dark_green"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:earth",custom_data={Magic:2}] 1
execute unless data entity @s[scores={f=1..}] {Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:3}}}]} run give @s[scores={use_items=1..2}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Fire","italic":false,"color":"red"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:fire",custom_data={Magic:3}] 1
execute unless data entity @s[scores={w=1..}] {Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:4}}}]} run give @s[scores={use_items=1..2}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Water","italic":false,"color":"dark_blue"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:water",custom_data={Magic:4}] 1
execute unless data entity @s[scores={s=1..}] {Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:5}}}]} run give @s[scores={use_items=1..2}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Spirit","italic":false,"color":"white"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:spirit",custom_data={Magic:5}] 1


function magic:weave_handling/add_element

scoreboard players set @s a 0
scoreboard players set @s e 0
scoreboard players set @s f 0
scoreboard players set @s w 0
scoreboard players set @s s 0
scoreboard players set @s click 0

