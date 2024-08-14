say add empty

item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with minecraft:air

#TODO need unique at times
execute store result storage magic:weave_add_element index int 1 run scoreboard players get @s player_weave_index

#-1 for newline
scoreboard players set @s reg_1 -1
function magic:weave_add_element with storage magic:weave_add_element