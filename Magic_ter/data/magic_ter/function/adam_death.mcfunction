################################################################################
#Purpose: Drops the adam collar item upon death of collared player (damane)
#Runner: collared player (damane)
#Return values:
#Authors: Boblegrob
################################################################################

#remove tags
tag @s remove damane
tag @s remove external_tap_blocked


#Replace adam helmet with collar item
execute as @e[type=item] if items entity @s contents *[custom_data~{Magic_ter_adam:collar}] run item replace entity @s container.0 with minecraft:carrot_on_a_stick[minecraft:custom_data={Magic_ter_adam:2}]

scoreboard players reset @s magic_ter_death