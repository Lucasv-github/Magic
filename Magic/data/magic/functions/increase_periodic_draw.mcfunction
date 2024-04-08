kill @e[type=minecraft:eye_of_ender,limit=1,sort=nearest, distance=..2]

#Prevent faster draw than 64 eyes as long as below halve amount hold
execute store result score @s reg_1 run clear @s minecraft:ender_eye 0
give @s minecraft:ender_eye{CustomModelData:0,display:{Name:'[{"text":"Force","italic":false,"color":"dark_purple"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:6} 1
execute if score @s reg_1 matches ..62 run give @s minecraft:ender_eye{CustomModelData:0,display:{Name:'[{"text":"Force","italic":false,"color":"dark_purple"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:6}

#Halve amount hold bypass
execute unless score @s reg_1 matches ..62 if score @s halve_amount_hold < @s current_held run give @s minecraft:ender_eye{CustomModelData:0,display:{Name:'[{"text":"Force","italic":false,"color":"dark_purple"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:6} 1
