################################################################################
#Purpose: Load the items from a stored hotbar into the owning player's hotbar or inventory if the slots are already taken
#Runner: A player whos stored hotbar should be loaded
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=minecraft:chest_minecart,tag=hotbar_storage] if score @s player_id = Temp reg_1 run tag @s add current_withdraw

#Copy current hotbar to storage second row if about to be overwritten
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.0 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.9 from entity @s hotbar.0
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.1 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.10 from entity @s hotbar.1
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.2 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.11 from entity @s hotbar.2
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.3 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.12 from entity @s hotbar.3
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.4 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.13 from entity @s hotbar.4
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.5 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.14 from entity @s hotbar.5
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.6 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.15 from entity @s hotbar.6
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.7 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.16 from entity @s hotbar.7
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.8 * run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.17 from entity @s hotbar.8

#Then every non air from first row to player
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.0 * run item replace entity @s hotbar.0 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.0
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.1 * run item replace entity @s hotbar.1 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.1
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.2 * run item replace entity @s hotbar.2 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.2
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.3 * run item replace entity @s hotbar.3 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.3
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.4 * run item replace entity @s hotbar.4 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.4
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.5 * run item replace entity @s hotbar.5 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.5
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.6 * run item replace entity @s hotbar.6 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.6
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.7 * run item replace entity @s hotbar.7 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.7
execute if items entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.8 * run item replace entity @s hotbar.8 from entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.8


#Clear first row to prevent giving that back
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.0 with minecraft:air
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.1 with minecraft:air
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.2 with minecraft:air
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.3 with minecraft:air
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.4 with minecraft:air
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.5 with minecraft:air
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.6 with minecraft:air
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.7 with minecraft:air
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_withdraw] container.8 with minecraft:air

#Give second row back
tp @e[type=minecraft:chest_minecart,tag=hotbar_storage, tag=current_withdraw] @s
kill @e[type=minecraft:chest_minecart,tag=hotbar_storage, tag=current_withdraw]

