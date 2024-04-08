scoreboard players operation Temp reg_1 = @s weave_execute_id
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 run tag @s add sever_active_me
tag @a[tag=sever_active_me,scores={shields_blocked=1..}] remove sever_active_me

scoreboard players operation Temp reg_1 = @s player_id

#TODO prevent this from being tied off probably
#Find person severinging, get held strenght
#Reset in case we find none (e.g tied of)
scoreboard players set @s reg_2 0
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 run scoreboard players operation @s reg_2 = @s current_held

#Send to player
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 run tellraw @a[tag=sever_active_me] ["",{"text":"--","color":"gold"},{"score":{"name":"@s","objective":"reg_2"},"color":"gold","clickEvent":{"action":"run_command","value":"/trigger state set 30"}},{"text":"--","color":"gold"}]
execute as @a[tag=sever_active_me] at @s run playsound minecraft:block.anvil.place ambient @s

execute unless score @a[tag=sever_active_me,limit=1] sever_active_time matches 1.. run scoreboard players set @a[tag=sever_active_me,limit=1] sever_active_time 10
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 run scoreboard players operation @a[tag=sever_active_me] sever_active_amount = @s reg_2
tag @a remove sever_active_me