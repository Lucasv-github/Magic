scoreboard players operation Temp reg_1 = @s player_id

execute as @e[type=minecraft:chest_minecart,name=hotbar_storage] if score @s player_id = Temp reg_1 run tag @s add current_withdraw

tp @e[type=chest_minecart, tag=current_withdraw] ~ ~ ~

#Remove storage
kill @e[sort=nearest,type=minecraft:chest_minecart,name=hotbar_storage, tag=current_withdraw]