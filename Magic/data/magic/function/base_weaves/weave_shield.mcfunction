function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

scoreboard players operation @s shield_lower_amount = @s reg_1
scoreboard players operation @s shield_lower_amount *= 10 reg_1

scoreboard players operation Temp reg_1 = @s weave_locked_player_id
scoreboard players operation Temp reg_2 = @s shield_lower_amount
function magic:shield_handling

function magic:weave_processing/advance_read_index

tag @s add weave_shield