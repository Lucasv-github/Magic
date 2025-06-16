#Clear old
scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=minecraft:chest_minecart,tag=hotbar_storage] if score @s player_id = Temp reg_1 run kill @s

execute at @s run summon chest_minecart ~ ~ ~ {Invulnerable:1b, Tags:["current_storage","hotbar_storage"], NoGravity:1b}
execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=hotbar_storage] player_id = @s player_id
execute at @s in minecraft:overworld run tp @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=hotbar_storage] 0 -80 0

#Copy bar
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.0 from entity @s hotbar.0
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.1 from entity @s hotbar.1
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.2 from entity @s hotbar.2
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.3 from entity @s hotbar.3
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.4 from entity @s hotbar.4
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.5 from entity @s hotbar.5

#Clear bar
execute unless data entity @s Inventory[{Slot:0b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.0 with minecraft:air
execute unless data entity @s Inventory[{Slot:1b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.1 with minecraft:air
execute unless data entity @s Inventory[{Slot:2b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.2 with minecraft:air
execute unless data entity @s Inventory[{Slot:3b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.3 with minecraft:air
execute unless data entity @s Inventory[{Slot:4b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.4 with minecraft:air
execute unless data entity @s Inventory[{Slot:5b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.5 with minecraft:air


#Some kludge to remove well / angreal
scoreboard players set @s reg_1 0
execute store result score @s reg_2 run data get entity @s SelectedItemSlot

execute as @s[tag=welled] run scoreboard players set @s reg_1 1
execute as @s[tag=angrealed] run scoreboard players set @s reg_1 1

execute as @s[scores={reg_1=1,reg_2=6}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.6 from entity @s hotbar.6
execute as @s[scores={reg_1=1,reg_2=6}] unless data entity @s Inventory[{Slot:6b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.6 with minecraft:air

execute as @s[scores={reg_1=1,reg_2=7}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.7 from entity @s hotbar.7
execute as @s[scores={reg_1=1,reg_2=7}] unless data entity @s Inventory[{Slot:7b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.7 with minecraft:air

execute as @s[scores={reg_1=1,reg_2=8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.8 from entity @s hotbar.8
execute as @s[scores={reg_1=1,reg_2=8}] unless data entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Magic_preserve run item replace entity @s hotbar.8 with minecraft:air

tag @e[sort=nearest,type=minecraft:chest_minecart,tag=hotbar_storage, tag=current_storage] remove current_storage
