scoreboard players operation Temp reg_1 = @s weave_owner_player_id

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

scoreboard players operation @s current_sink = @s reg_1

function magic:weave_processing/advance_read_index

tag @s add weave_sink_power