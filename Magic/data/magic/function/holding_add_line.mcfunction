#TODO remove holding from name? as this does not require holding
#add_line currently does exactly the same without swapping bakc
#Actually to offhand add line?

execute at @s run playsound minecraft:entity.item.pickup player @s

item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with minecraft:air

execute store result storage magic:weave_add_element index int 1 run scoreboard players get @s player_weave_index

#-1 for newline
scoreboard players set @s reg_1 -1
function magic:weave_add_element with storage magic:weave_add_element