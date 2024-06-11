#tellraw @a {"score":{"name":"@s","objective":"weave_execute_id"},"color":"red"}

scoreboard players operation Temp reg_1 = @s weave_execute_id
scoreboard players operation Temp reg_2 = @s player_id

#Find person we want to shield
#Can't shield if not circle owner
execute as @a[tag=can_use] if score @s player_id = Temp reg_1 unless score @s player_id = Temp reg_2 run tag @s add shield_me
tag @a[tag=shield_me,scores={shields_blocked=1..}] remove shield_me

effect give @a[tag=shield_me] minecraft:blindness 1

scoreboard players operation Temp reg_1 = @s player_id

#Find person shielding, get held strength
#Reset in case we find none (e.g tied of)
scoreboard players set @s reg_1 0
execute as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_2 run scoreboard players operation @s reg_1 = @s current_held



#Get strength of person being shilded
execute as @a[tag=can_use, tag=shield_me] run scoreboard players operation @s reg_1 = @s current_held

#To sever you need x4 strength, double to just that
scoreboard players operation @a[tag=can_use, tag=using, tag=shield_me] reg_1 += @a[tag=can_use, tag=shield_me, limit=1] reg_1
scoreboard players operation @a[tag=can_use, tag=using, tag=shield_me] reg_1 += @a[tag=can_use, tag=shield_me, limit=1] reg_1

#Execute if shilder has x4 greater

execute if score @s current_held > @a[tag=can_use, tag=shield_me, limit=1] reg_1 run scoreboard players set @a[tag=can_use, tag=shield_me, limit=1] shilded 20
execute if score @s current_held > @a[tag=can_use, tag=shield_me, limit=1] reg_1 as @a[tag=can_use, tag=shield_me, limit=1] run function magic:remove_cleanup_player_all

execute as @s[tag=!tied_off] if entity @a[tag=can_use, tag=shield_me,scores={shilded=1..}] as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_2 at @s run playsound minecraft:block.anvil.place ambient @s
execute as @s[tag=!tied_off] unless entity @a[tag=can_use, tag=shield_me,scores={shilded=1..}] as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_2 run function magic:stun

tag @a remove shield_me