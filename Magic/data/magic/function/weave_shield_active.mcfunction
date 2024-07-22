scoreboard players operation Temp reg_1 = @s weave_execute_id
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 run tag @s add shield_active_me

#Prevent self
execute if score Temp reg_1 = @s player_id run tag @a remove shield_active_me

tag @a[tag=shield_active_me,scores={shields_blocked=1..}] remove shield_active_me

scoreboard players operation Temp reg_1 = @s player_id

#Find person shielding, get held strength
#Reset in case we find none (e.g tied of)
scoreboard players set @s reg_2 0
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 run scoreboard players operation @s reg_2 = @s current_held

#Send to player
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 run tellraw @a[tag=shield_active_me] ["",{"text":"~~","color":"gold"},{"score":{"name":"@s","objective":"reg_2"},"color":"gold","clickEvent":{"action":"run_command","value":"/trigger state set 20"}},{"text":"~~","color":"gold"}]
execute as @a[tag=shield_active_me] at @s run playsound minecraft:block.anvil.place ambient @s

execute unless score @a[tag=shield_active_me,limit=1] shield_active_time matches 1.. run scoreboard players set @a[tag=shield_active_me,limit=1] shield_active_time 4
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 run scoreboard players operation @a[tag=shield_active_me] shield_active_amount = @s reg_2
scoreboard players operation @a[tag=shield_active_me] shield_active_amount /= 2 reg_1
tag @a remove shield_active_me