function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

scoreboard players operation @s shield_lower_amount = @s reg_1
scoreboard players operation @s shield_lower_amount *= 100 reg_1

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id

#execute as @e if score @s entity_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s cumulative_halve_amount_hold
#execute if score @s shield_lower_amount matches 1.. run scoreboard players operation Temp reg_2 -= @s shield_lower_amount

#scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
#execute as @e if score @s entity_id = Temp reg_1 run say getting shielded

#scoreboard players operation Temp reg_2 = @s shield_lower_amount
#function magic:magic_actions/shield_handling

function magic:weave_processing/advance_read_index

tag @s add weave_shield
