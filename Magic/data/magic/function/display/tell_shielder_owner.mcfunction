################################################################################
#Purpose: Tell player owning the weave denoted by @s that they shielded someone
#Runner: An armorstand holding a weave whose owner should be told
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s player_id
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 at @s run playsound minecraft:block.anvil.place ambient @s
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run tellraw @s {"text":"[~]","bold":true,"color":"gold"}