function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

tag @s[scores={reg_1=3}] add weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 2 run tag @s remove weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 1 run tag @s remove weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 2 run tag @s remove weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 3 run tag @s remove weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 4 run tag @s remove weave_mask_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

tag @s[scores={reg_1=5}] add inverted

function magic:weave_processing/advance_read_index

tag @s remove weave_mask_ability_temp_works