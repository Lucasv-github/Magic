################################################################################
#Purpose: Punish an entity if the difference between draw and drain is large
#Runner: An entity to be punished
#Return values:
#Authors: Lprogrammer
################################################################################

execute if score @s current_drain > @s current_draw run function magic:power_handling/exit
execute as @s[tag=!using] run return 0

#Temp reg_1: Excess draw * 10
scoreboard players operation Temp reg_1 = @s current_draw
scoreboard players operation Temp reg_1 -= @s current_drain


#+10 1 eye
execute if score Temp reg_1 matches 100.. run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 1

execute if score Temp reg_1 matches 400.. run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 1

execute if score Temp reg_1 matches 800.. run give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 1
