################################################################################
#Purpose: Removes adam from player and drops adam collar item
#Runner: collared player (damane)
#Return values:
#Authors: Boblegrob & Lprogrammer
################################################################################

item replace entity @s armor.head with air 

give @n[scores={sneak_time=100},type=player] carrot_on_a_stick[custom_name=[{"text":"a'dam collar","italic":false}],custom_data={Magic_ter_adam:2},item_model="magic_resourcepack:adam_collar_px"]
scoreboard players operation Temp reg_1 = @s entity_id
execute as @e[type=minecraft:armor_stand,tag=damane_shield] if score @s weave_locked_entity_id = Temp reg_1 run kill @s

tag @s remove damane

