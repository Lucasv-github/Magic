################################################################################
#Purpose: Fuses adam collar item and adam bracelet item into original adam item
#Runner: player using the adam bracelet item
#Return values:
#Authors: Boblegrob & Lprogrammer
################################################################################

execute store success score Temp reg_1 run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={Magic_ter_adam:2}] 1

execute if score Temp reg_1 matches 1 run item modify entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:item_model":"magic_resourcepack:adam","minecraft:custom_data":{"Magic_ter_adam":0}}}