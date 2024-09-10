scoreboard players operation Temp reg_1 = @s weave_locked_player_id

#Get stunner strength in Temp reg_4
scoreboard players operation Temp reg_1 = @s player_id
scoreboard players set Temp reg_4 0
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_4 = @s cumulative_halve_amount_hold

#Multiply stunner strength by weave size
$scoreboard players set Temp reg_2 $(size)
scoreboard players operation Temp reg_4 *= Temp reg_2

scoreboard players operation Temp reg_1 = @s weave_locked_player_id

#Divide by person getting stunned
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_4 /= @s cumulative_halve_amount_hold

execute store result storage magic:stun stun_amount int 1 run scoreboard players get Temp reg_4

execute at @s as @a[tag=using] if score @s player_id = Temp reg_1 run function magic:stun with storage magic:stun

tag @s add weave_damaged