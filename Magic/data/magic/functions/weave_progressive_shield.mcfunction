scoreboard players operation Temp reg_1 = @s weave_execute_id
scoreboard players operation Temp reg_2 = @s player_id
execute as @a[tag=can_use] if score @s player_id = Temp reg_1 unless score @s player_id = Temp reg_2 run tag @s add progressive_shield_me
tag @a[tag=progressive_shield_me,scores={shields_blocked=1..}] remove progressive_shield_me

#TODO subtract with shielder strenght instead of 10
scoreboard players operation @a[tag=progressive_shield_me,scores={progressive_shielded=0, shilded=0}] progressive_shield_current = @s halve_amount_hold
execute as @s[tag=!tied_off] run scoreboard players remove @a[tag=progressive_shield_me,scores={progressive_shielded=1.., shilded=0}] progressive_shield_current 10
execute as @s[tag=!tied_off] run scoreboard players operation @a[tag=progressive_shield_me,scores={progressive_shielded=1.., shilded=0}] cumulative_halve_amount_hold = @a[tag=progressive_shield_me,scores={progressive_shielded=1.., shilded=0}] progressive_shield_current

scoreboard players set @a[tag=progressive_shield_me,scores={shilded=0}] progressive_shielded 20

#Regular shield if driven to 0
scoreboard players set @a[tag=progressive_shield_me,scores={progressive_shield_current=..0}] shilded 20
scoreboard players set @a[tag=progressive_shield_me,scores={progressive_shield_current=..0}] progressive_shielded 0

execute as @s[tag=!tied_off] if entity @a[tag=can_use, tag=progressive_shield_me, limit=1,scores={shilded=1..}] as @a[tag=can_use,tag=using] if score @s player_id = Temp reg_2 at @s run playsound minecraft:block.anvil.place ambient @s

tag @a remove progressive_shield_me