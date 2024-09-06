function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

scoreboard players operation @s shield_lower_amount = @s reg_1
scoreboard players operation @s shield_lower_amount *= 10 reg_1

#TODO sound feedback + differently based on strengths

#TODO own function and call that in tap power as well

scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s shield_lower_amount

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 unless score Temp reg_2 = @s cumulative_halve_amount_hold if score @s current_held > Temp reg_2 run scoreboard players operation @s reg_1 = @s current_held
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 unless score Temp reg_2 = @s cumulative_halve_amount_hold if score @s current_held > Temp reg_2 run scoreboard players operation @s reg_1 /= 10 reg_1
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 unless score Temp reg_2 = @s cumulative_halve_amount_hold if score @s current_held > Temp reg_2 run scoreboard players operation @s current_held -= @s reg_1

function magic:weave_processing/advance_read_index

tag @s add weave_shield