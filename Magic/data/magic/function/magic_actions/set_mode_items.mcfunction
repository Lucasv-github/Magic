tellraw @s {"text":"Default toggled","color":"gold"}

clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:1}]
clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:2}]
clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:3}]
clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:4}]
clear @s minecraft:carrot_on_a_stick[custom_data~{Magic:5}]

give @s minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Air","italic":false,"color":"aqua"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],minecraft:item_model="magic_resourcepack:air",custom_data={Magic:1}] 1
give @s minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Earth","italic":false,"color":"dark_green"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],minecraft:item_model="magic_resourcepack:earth",custom_data={Magic:2}] 1
give @s minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Fire","italic":false,"color":"gold"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],minecraft:item_model="magic_resourcepack:fire",custom_data={Magic:3}] 1
give @s minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Water","italic":false,"color":"dark_blue"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],minecraft:item_model="magic_resourcepack:water",custom_data={Magic:4}] 1
give @s minecraft:carrot_on_a_stick[enchantment_glint_override=1b,custom_name='[{"text":"Spirit","italic":false,"color":"white"}]',lore=['[{"text":"One of the 5 elements","italic":false}]'],minecraft:item_model="magic_resourcepack:spirit",custom_data={Magic:5}] 1

scoreboard players set @s use_items_current 1