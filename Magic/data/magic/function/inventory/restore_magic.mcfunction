################################################################################
#Purpose: Undos what inventory/restore_regular.mcfunction did by giving back all non weave magic interaction items
#Runner: A player who should get their interaction items back
#Return values:
#Authors: Lprogrammer
################################################################################

function magic:inventory/store_hotbar

give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Air","italic":false,"color":"aqua"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:air",custom_data={Magic:1}] 1
give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Earth","italic":false,"color":"dark_green"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:earth",custom_data={Magic:2}] 1
give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Fire","italic":false,"color":"red"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:fire",custom_data={Magic:3}] 1
give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Water","italic":false,"color":"dark_blue"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:water",custom_data={Magic:4}] 1
give @s[tag=using,scores={use_items=1}] minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name=[{"text":"Spirit","italic":false,"color":"white"}],lore=[[{"text":"One of the 5 elements","italic":false}]],minecraft:item_model="magic_resourcepack:spirit",custom_data={Magic:5}] 1
#32, perfectly balanced
give @s[tag=using] minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1}] 32
