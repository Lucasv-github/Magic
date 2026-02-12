function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

tag @s[scores={reg_1=1}] add weave_server_temp_works

function magic:weave_processing/advance_read_index

#Next last line
scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 = @s weave_spirit_count run tag @s remove weave_server_temp_works

function magic:weave_processing/advance_read_index

#Last line
scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 = @s weave_spirit_count run tag @s remove weave_server_temp_works

#Need to have a size greater than halve_amount_hold to sever
scoreboard players operation Temp reg_1 = @s weave_locked_player_id
scoreboard players operation Temp reg_2 = @s weave_spirit_count
scoreboard players operation Temp reg_2 *= 10 reg_1
execute as @s[tag=weave_server_temp_works] as @a[tag=can_use,tag=!using,tag=!circled] if score @s player_id = Temp reg_1 if score @s halve_amount_hold < Temp reg_2 run function magic:power_handling/sever

function magic:weave_processing/advance_read_index

tag @s remove weave_server_temp_works



