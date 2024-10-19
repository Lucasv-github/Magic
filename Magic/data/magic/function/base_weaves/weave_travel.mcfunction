function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute as @s if score @s weave_spirit_count = @s reg_1 run tag @s add weave_travel_temp_works


function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_spirit_count = @s reg_1 run tag @s remove weave_travel_temp_works


function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_spirit_count = @s reg_1 run tag @s remove weave_travel_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_spirit_count = @s reg_1 run tag @s remove weave_travel_temp_works


function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_spirit_count = @s reg_1 run tag @s remove weave_travel_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single
scoreboard players operation @s[tag=!holds_travel] destination_x = @s reg_1
function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single
scoreboard players operation @s[tag=!holds_travel] destination_y = @s reg_1
function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single
scoreboard players operation @s[tag=!holds_travel] destination_z = @s reg_1
function magic:weave_processing/advance_read_index

#Want to advance the reads to prevent explosion when parsing as something else
execute as @s[tag=holds_travel] run return 0

scoreboard players operation Temp destination_x = @s destination_x
scoreboard players operation Temp destination_y = @s destination_y
scoreboard players operation Temp destination_z = @s destination_z

scoreboard players operation Temp reg_1 = @s player_id

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[y_rotation=-0..90] run scoreboard players operation Temp destination_x *= -10 reg_1
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[y_rotation=-0..90] run scoreboard players operation Temp destination_z *= 10 reg_1

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[y_rotation=90..180] run scoreboard players operation Temp destination_x *= -10 reg_1
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[y_rotation=90..180] run scoreboard players operation Temp destination_z *= -10 reg_1

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[y_rotation=-180..-90] run scoreboard players operation Temp destination_x *= 10 reg_1
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[y_rotation=-180..-90] run scoreboard players operation Temp destination_z *= -10 reg_1

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[y_rotation=-90..0] run scoreboard players operation Temp destination_x *= 10 reg_1
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[y_rotation=-90..0] run scoreboard players operation Temp destination_z *= 10 reg_1

execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[x_rotation=45..90] run scoreboard players operation Temp destination_y *= -10 reg_1
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 as @s[x_rotation=45..0] run scoreboard players operation Temp destination_y *= -10 reg_1

execute store result score @s destination_x run data get entity @s Pos[0]
execute store result score @s destination_y run data get entity @s Pos[1]
execute store result score @s destination_z run data get entity @s Pos[2]

scoreboard players operation @s destination_x += Temp destination_x
scoreboard players operation @s destination_y += Temp destination_y
scoreboard players operation @s destination_z += Temp destination_z

execute at @s[tag=weave_travel_temp_works] run function magic:weaves/weave_travel

tag @s remove weave_travel_temp_works



