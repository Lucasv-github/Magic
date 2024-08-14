scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s weave_execute_id

execute as @a if score @s player_id = Temp reg_2 store result score Temp reg_3 run data get entity @s Health
execute as @a if score @s player_id = Temp reg_1 run tellraw @s ["",{"text":"Health: ","color":"gold"},{"score":{"name":"Temp","objective":"reg_3"},"color":"gold"}]

execute as @a if score @s player_id = Temp reg_2 store result score Temp reg_3 run data get entity @s foodLevel
execute as @a if score @s player_id = Temp reg_1 run tellraw @s ["",{"text":"Hunger: ","color":"gold"},{"score":{"name":"Temp","objective":"reg_3"},"color":"gold"}]