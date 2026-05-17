function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s if score @s weave_fire_count = @s reg_1 run tag @s add weave_travel_temp_works


function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_fire_count = @s reg_1 run tag @s remove weave_travel_temp_works


function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_fire_count = @s reg_1 run tag @s remove weave_travel_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_fire_count = @s reg_1 run tag @s remove weave_travel_temp_works


function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_fire_count = @s reg_1 run tag @s remove weave_travel_temp_works


function magic:weave_processing/advance_read_index
execute as @s[tag=holds_travel] run return 0

scoreboard players operation Temp reg_1 = @s weave_owner_entity_id
execute as @e[tag=using] if score @s entity_id = Temp reg_1 run scoreboard players operation Temp destination_x = @s x
execute as @e[tag=using] if score @s entity_id = Temp reg_1 run scoreboard players operation Temp destination_y = @s y
execute as @e[tag=using] if score @s entity_id = Temp reg_1 run scoreboard players operation Temp destination_z = @s z

execute at @s[tag=weave_travel_temp_works] run function magic:weave_actions/create_gateway

tag @s remove weave_travel_temp_works