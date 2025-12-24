say fill if allowed

tag @s add awaiting_fill

#$say fill if allowed $(x_s) $(y_s) $(z_s) $(x_e) $(y_e) $(z_e)

summon minecraft:armor_stand ~ ~ ~ {Tags:[position_grab]}

execute store result storage magic:set_fill_data entity_id int 1 run scoreboard players get @s entity_id
$data modify storage magic:set_fill_data block set value $(block)

function magic:actions/set_fill_data with storage magic:set_fill_data

#$data modify storage magic:fill data append value {x_s:$(x_s),y_s:$(y_s),z_s:$(z_s),x_e:$(x_e),y_e:$(y_e),z_e:$(z_e),block:$(block)}

execute as @n[type=minecraft:armor_stand,tag=position_grab] run say aaaa

execute store result score @s reg_1 run data get entity @n[type=minecraft:armor_stand,tag=position_grab] Pos[0]
execute store result score @s reg_2 run data get entity @n[type=minecraft:armor_stand,tag=position_grab] Pos[1]
execute store result score @s reg_3 run data get entity @n[type=minecraft:armor_stand,tag=position_grab] Pos[2]

$scoreboard players set @s safe_fill_x_s $(x_s)
$scoreboard players set @s safe_fill_y_s $(y_s)
$scoreboard players set @s safe_fill_z_s $(z_s)

scoreboard players operation @s safe_fill_x_s += @s reg_1
scoreboard players operation @s safe_fill_y_s += @s reg_2
scoreboard players operation @s safe_fill_z_s += @s reg_3

$scoreboard players set @s safe_fill_x_e $(x_e)
$scoreboard players set @s safe_fill_y_e $(y_e)
$scoreboard players set @s safe_fill_z_e $(z_e)

scoreboard players operation @s safe_fill_x_e += @s reg_1
scoreboard players operation @s safe_fill_y_e += @s reg_2
scoreboard players operation @s safe_fill_z_e += @s reg_3


scoreboard players operation @s safe_fill_chunk_x_s = @s safe_fill_x_s
scoreboard players remove @s safe_fill_chunk_x_s 16


scoreboard players operation @s safe_fill_chunk_z_s = @s safe_fill_z_s
scoreboard players remove @s safe_fill_chunk_z_s 16


scoreboard players operation @s safe_fill_chunk_x_e = @s safe_fill_x_e
scoreboard players add @s safe_fill_chunk_x_e 16

scoreboard players operation @s safe_fill_chunk_z_e = @s safe_fill_z_e
scoreboard players add @s safe_fill_chunk_z_e 16


scoreboard players operation @s safe_fill_chunk_x_c = @s safe_fill_chunk_x_s
scoreboard players operation @s safe_fill_chunk_z_c = @s safe_fill_chunk_z_s

function magic:actions/fill_if_allowed_iteration

kill @n[type=minecraft:armor_stand,tag=position_grab]

tellraw @p ["",{"score":{"name":"@s","objective":"safe_fill_x_s"}},{"text":" "},{"score":{"name":"@s","objective":"safe_fill_y_s"}},{"text":" "},{"score":{"name":"@s","objective":"safe_fill_z_s"}},{"text":" "},{"score":{"name":"@s","objective":"safe_fill_x_e"}},{"text":" "},{"score":{"name":"@s","objective":"safe_fill_y_e"}},{"text":" "},{"score":{"name":"@s","objective":"safe_fill_z_e"}}]