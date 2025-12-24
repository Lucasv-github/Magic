say FIAI

tellraw @p ["",{"text":"Iteration: "},{"score":{"name":"@s","objective":"safe_fill_chunk_x_e"}},{"text":" "},{"score":{"name":"@s","objective":"safe_fill_chunk_z_e"}},{"text":" "}]


scoreboard players operation @s reg_1 = @s safe_fill_chunk_x_c
scoreboard players operation @s reg_2 = @s safe_fill_chunk_z_c

#Clamping within min/max
#Yeah this will make multiple checks of a single chunk, but does it matter?
execute if score @s reg_1 < @s safe_fill_x_s run scoreboard players operation @s reg_1 = @s safe_fill_x_s
execute if score @s reg_1 > @s safe_fill_x_e run scoreboard players operation @s reg_1 = @s safe_fill_x_e

execute if score @s reg_2 < @s safe_fill_z_s run scoreboard players operation @s reg_2 = @s safe_fill_z_s
execute if score @s reg_2 > @s safe_fill_z_e run scoreboard players operation @s reg_2 = @s safe_fill_z_e

execute store result storage magic:check_fill_allowed x int 1 run scoreboard players get @s reg_1
execute store result storage magic:check_fill_allowed z int 1 run scoreboard players get @s reg_2 

function magic:actions/check_fill_allowed with storage magic:check_fill_allowed 

scoreboard players add @s safe_fill_chunk_x_c 16

#Z increment
execute if score @s safe_fill_chunk_x_c > @s safe_fill_chunk_x_e run scoreboard players add @s safe_fill_chunk_z_c 16
execute if score @s safe_fill_chunk_x_c > @s safe_fill_chunk_x_e run scoreboard players operation @s safe_fill_chunk_x_c = @s safe_fill_chunk_x_s

execute unless score @s safe_fill_chunk_x_c > @s safe_fill_chunk_x_e unless score @s safe_fill_chunk_z_c > @s safe_fill_chunk_z_e run function magic:actions/fill_if_allowed_iteration