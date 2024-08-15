function magic:advance_read_index

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

scoreboard players operation Temp reg_1 = @s weave_execute_id
$execute if score @s reg_1 = @s weave_earth_count as @a if score @s player_id = Temp reg_1 run effect give @s minecraft:resistance 20 $(size) true

function magic:advance_read_index