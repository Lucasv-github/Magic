################################################################################
#Purpose: Punish an entity if the difference between draw and drain is large
#Runner: An entity to be punished
#Return values:
#Authors: Lprogrammer
################################################################################


#Temp reg_1: Excess draw * 10
scoreboard players operation Temp reg_1 = @s current_draw
scoreboard players operation Temp reg_1 *= 10 reg_1

scoreboard players operation Temp reg_1 /= @s current_drain

#Temp reg_2: Excess drain * 10
scoreboard players operation Temp reg_2 = @s current_drain
scoreboard players operation Temp reg_2 *= 10 reg_1

scoreboard players operation Temp reg_2 /= @s current_draw

#TODO future math to give/take n instead of hard coded

#x2: Regulator change: 1
execute if score Temp reg_1 matches 20.. run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 1

execute if score Temp reg_2 matches 20.. run clear @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 1

#x4: Regulartor change: 2
execute if score Temp reg_1 matches 40.. run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 2

execute if score Temp reg_2 matches 40.. run clear @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 2

#x8: Regulartor change: 4
execute if score Temp reg_1 matches 80.. run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 4

execute if score Temp reg_2 matches 80.. run clear @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 4

#tellraw @s {score:{name:"Temp",objective:"reg_1"},color:"dark_green"}
#tellraw @s {score:{name:"Temp",objective:"reg_2"},color:"dark_red"}