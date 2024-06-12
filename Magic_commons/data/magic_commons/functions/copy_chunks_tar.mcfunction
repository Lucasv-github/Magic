execute store result storage tar_coordinates player_id int 1 run scoreboard players get @s player_id

execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates


#X+
scoreboard players add @s reg_1 16
execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates
scoreboard players remove @s reg_1 16

#X-
scoreboard players remove @s reg_1 16
execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates
scoreboard players add @s reg_1 16

#Y+
scoreboard players add @s reg_2 16
execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates
scoreboard players remove @s reg_2 16

#Y-
scoreboard players remove @s reg_2 16
execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates
scoreboard players add @s reg_2 16

#X+ Y+
scoreboard players add @s reg_1 16
scoreboard players add @s reg_2 16
execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates
scoreboard players remove @s reg_1 16
scoreboard players remove @s reg_2 16

#X- Y-
scoreboard players remove @s reg_1 16
scoreboard players remove @s reg_2 16
execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates
scoreboard players add @s reg_1 16
scoreboard players add @s reg_2 16

#X- Y+
scoreboard players remove @s reg_1 16
scoreboard players add @s reg_2 16
execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates
scoreboard players add @s reg_1 16
scoreboard players remove @s reg_2 16

#X+ Y-
scoreboard players add @s reg_1 16
scoreboard players remove @s reg_2 16
execute store result storage tar_coordinates x int 1 run scoreboard players get @s reg_1
execute store result storage tar_coordinates y int 1 run scoreboard players get @s reg_2
function magic_commons:prepare_copy_to_tar with storage minecraft:tar_coordinates
scoreboard players remove @s reg_1 16
scoreboard players add @s reg_2 16