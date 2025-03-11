#Clear old
scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=minecraft:chest_minecart,tag=weave_hotbar_storage] if score @s player_id = Temp reg_1 run data modify entity @s Items set value []
execute as @e[type=minecraft:chest_minecart,tag=weave_hotbar_storage] if score @s player_id = Temp reg_1 run kill @s

execute at @s run summon chest_minecart ~ ~ ~ {Invulnerable:1b, Tags:["current_storage","weave_hotbar_storage"], NoGravity:1b}
execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=weave_hotbar_storage] player_id = @s player_id
execute at @s in minecraft:overworld run tp @e[limit=1,sort=nearest,type=minecraft:chest_minecart,tag=weave_hotbar_storage] 0 -80 0

#Copy weaves
execute if items entity @s hotbar.0 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.0 from entity @s hotbar.0
execute if items entity @s hotbar.1 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.1 from entity @s hotbar.1
execute if items entity @s hotbar.2 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.2 from entity @s hotbar.2
execute if items entity @s hotbar.3 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.3 from entity @s hotbar.3
execute if items entity @s hotbar.4 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.4 from entity @s hotbar.4
execute if items entity @s hotbar.5 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.5 from entity @s hotbar.5
execute if items entity @s hotbar.6 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.6 from entity @s hotbar.6
execute if items entity @s hotbar.7 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.7 from entity @s hotbar.7
execute if items entity @s hotbar.8 minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.8 from entity @s hotbar.8

tag @e[sort=nearest,type=minecraft:chest_minecart,tag=weave_hotbar_storage, tag=current_storage] remove current_storage