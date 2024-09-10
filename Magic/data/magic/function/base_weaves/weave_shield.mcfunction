function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

scoreboard players operation @s shield_lower_amount = @s reg_1
scoreboard players operation @s shield_lower_amount *= 10 reg_1

#TODO sound feedback + differently based on strengths

#TODO own function and call that in tap power as well

#Get shielder strength in Temp reg_4
scoreboard players operation Temp reg_1 = @s player_id
scoreboard players set Temp reg_4 0
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_4 = @s cumulative_halve_amount_hold

#Multiply shielder strength by 10
scoreboard players operation Temp reg_4 *= 10 reg_1

scoreboard players operation Temp reg_1 = @s weave_locked_player_id

#Divide by person getting shielded
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_4 /= @s cumulative_halve_amount_hold

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_3 = @s cumulative_halve_amount_hold
scoreboard players operation Temp reg_2 = @s shield_lower_amount

execute if score Temp reg_2 matches 1.. run scoreboard players operation Temp reg_3 -= Temp reg_2
scoreboard players operation Temp reg_2 = Temp reg_3

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 unless score Temp reg_2 = @s cumulative_halve_amount_hold if score @s current_held > Temp reg_2 run scoreboard players operation @s reg_1 = @s current_held
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 unless score Temp reg_2 = @s cumulative_halve_amount_hold if score @s current_held > Temp reg_2 run scoreboard players operation @s current_held -= Temp reg_4

function magic:weave_processing/advance_read_index

tag @s add weave_shield