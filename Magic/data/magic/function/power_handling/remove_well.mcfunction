tag @s remove welled

#In case of exit restore what wasn't consumed
scoreboard players operation Temp reg_1 = @s well_slot
scoreboard players operation Temp reg_2 = @s well_amount

#Too high negative might make recharge impossible
execute if score @s well_amount matches ..0 run scoreboard players set @s well_amount 0

function magic:magic_actions/set_well_amount

