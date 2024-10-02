#Can only add line to weave in slot 9

#TODO remove holding from name? as this does not require holding
#add_line currently does exactly the same without swapping back
#Actually to offhand add line?

execute at @s run playsound minecraft:entity.sniffer.drop_seed player @s

execute at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"holding_add_line_swap"}', Invulnerable:1b, Tags:["holding_add_line_swap"], NoGravity:1}

item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=holding_add_line_swap] container.0 from entity @s weapon.mainhand

item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @e[type=minecraft:chest_minecart, limit=1, tag=holding_add_line_swap] container.0

#Clear before kill
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=holding_add_line_swap] container.0 with minecraft:air

kill @e[type=minecraft:chest_minecart, tag=holding_add_line_swap]

execute store result storage magic:weave_storage_add_data index int 1 run scoreboard players get @s player_weave_index

#-1 for newline
scoreboard players set @s reg_1 -1
function magic:weave_handling/weave_storage_add_data with storage magic:weave_storage_add_data