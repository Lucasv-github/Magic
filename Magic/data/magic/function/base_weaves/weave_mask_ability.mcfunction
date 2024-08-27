function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

tag @s[scores={reg_1=9}] add weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 1 run tag @s remove weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 9 run tag @s remove weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 10 run tag @s remove weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

scoreboard players operation Temp reg_1 = @s weave_locked_player_id
execute as @s[scores={reg_1=9}] as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players set @s disguise 20

function magic:weave_processing/advance_read_index

tag @s remove weave_mask_ability_temp_works