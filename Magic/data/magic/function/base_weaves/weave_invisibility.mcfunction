function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

tag @s[scores={reg_1=2}] add weave_invisibility_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 1 run tag @s remove weave_invisibility_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 2 run tag @s remove weave_invisibility_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 3 run tag @s remove weave_invisibility_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute as @s unless score @s reg_1 matches 2 run tag @s remove weave_invisibility_temp_works

function magic:weave_processing/advance_read_index

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
execute as @s[tag=weave_invisibility_temp_works] as @e if score @s entity_id = Temp reg_1 run effect give @s invisibility 20 1 true
execute as @s[tag=weave_invisibility_temp_works] run tag @s add weave_invisibility

tag @e remove weave_invisibility_temp_works