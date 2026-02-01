################################################################################
#Purpose: Retrieves the argument for the safe fill that is now to be instantiated and then finalizes the fill
#Runner: An armorstand with a safe fill context that has waited to the next tick and has now checked that filling is safe
#Return values:
#Authors: Lprogrammer
################################################################################

execute store result storage magic:finalize_safe_fill_sub x_s int 1 run scoreboard players get @s safe_fill_x_s
execute store result storage magic:finalize_safe_fill_sub y_s int 1 run scoreboard players get @s safe_fill_y_s
execute store result storage magic:finalize_safe_fill_sub z_s int 1 run scoreboard players get @s safe_fill_z_s

execute store result storage magic:finalize_safe_fill_sub x_e int 1 run scoreboard players get @s safe_fill_x_e
execute store result storage magic:finalize_safe_fill_sub y_e int 1 run scoreboard players get @s safe_fill_y_e
execute store result storage magic:finalize_safe_fill_sub z_e int 1 run scoreboard players get @s safe_fill_z_e

execute store result storage magic:get_fill_data entity_id int 1 run scoreboard players get @s entity_id
function magic:actions/get_fill_data with storage magic:get_fill_data

data remove storage magic:get_fill_data entity_id

function magic:actions/finalize_safe_fill_sub with storage magic:finalize_safe_fill_sub

data remove storage magic:finalize_safe_fill_sub x_s
data remove storage magic:finalize_safe_fill_sub y_s
data remove storage magic:finalize_safe_fill_sub z_s

data remove storage magic:finalize_safe_fill_sub x_e
data remove storage magic:finalize_safe_fill_sub y_e
data remove storage magic:finalize_safe_fill_sub z_e

data remove storage magic:finalize_safe_fill_sub argument