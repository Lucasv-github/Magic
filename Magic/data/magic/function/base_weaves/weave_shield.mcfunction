function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

scoreboard players operation @s shield_lower_amount = @s reg_1
scoreboard players operation @s shield_lower_amount *= 100 reg_1

function magic:weave_handling/register_rest_draw
function magic:weave_handling/get_rest_draw
scoreboard players operation Temp reg_1 /= 10 reg_1
scoreboard players operation @s current_sink = Temp reg_1

#Good old 3:1
scoreboard players operation Temp reg_1 /= 3 reg_1

#10 adjust
scoreboard players operation Temp reg_1 *= 10 reg_1

#For testing
#scoreboard players operation Temp reg_1 *= 10 reg_1

#tellraw @a ["",{text:"Shielder rest: ",color:"dark_red"},{score:{name:"Temp",objective:"reg_1"},color:"dark_red"}]

scoreboard players operation Temp reg_2 = @s weave_locked_entity_id
scoreboard players set Temp reg_3 0

execute as @e[tag=using] if score @s entity_id = Temp reg_2 if score @s current_draw <= Temp reg_1 run scoreboard players set Temp reg_3 1

execute if score Temp reg_3 matches 1 run say Shield locked
execute if score Temp reg_3 matches 1 run tag @s add shield_locked

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id

scoreboard players operation @s reg_1 *= 100 reg_1
execute if score @s reg_1 = @s shield_lower_amount as @e[tag=using] if score @s entity_id = Temp reg_1 run say RIP
execute if score @s reg_1 = @s shield_lower_amount as @e[tag=using] if score @s entity_id = Temp reg_1 run tag @s add shield_sever
execute if score @s reg_1 = @s shield_lower_amount run function magic:weave_processing/advance_read_index

tag @s add weave_shield
