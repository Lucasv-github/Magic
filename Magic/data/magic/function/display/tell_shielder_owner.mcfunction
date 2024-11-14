scoreboard players operation Temp reg_1 = @s player_id
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 at @s run playsound minecraft:block.anvil.place ambient @s
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run tellraw @s {"text":"[~]","bold":true,"color":"gold"}