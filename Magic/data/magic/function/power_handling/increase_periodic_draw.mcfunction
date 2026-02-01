################################################################################
#Purpose: Increase the amount of draw adjustors in a player inventory
#Runner: A player whose draw adjustor count should get increased by 1
#Return values:
#Authors: Lprogrammer
################################################################################

give @s minecraft:carrot_on_a_stick[!damage,!max_damage,max_stack_size=64,enchantment_glint_override=1b,custom_name=[{"text":"Force","italic":false,"color":"dark_purple"}],lore=[[{"text":"Controls your power","italic":false}]],minecraft:item_model="magic_resourcepack:power",custom_data={Magic:6,Magic_preserve:1,Magic_interaction:1b}] 1

scoreboard players set @s click 0