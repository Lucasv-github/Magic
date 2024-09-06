function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

tag @s[scores={reg_1=3}] add weave_invert_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 2 run tag @s remove weave_invert_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 1 run tag @s remove weave_invert_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 2 run tag @s remove weave_invert_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 3 run tag @s remove weave_invert_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 4 run tag @s remove weave_invert_ability_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 5 run tag @s remove weave_invert_ability_temp_works

function magic:weave_processing/advance_read_index

tag @s[tag=weave_invert_ability_temp_works] add inverted

tag @s remove weave_invert_ability_temp_works