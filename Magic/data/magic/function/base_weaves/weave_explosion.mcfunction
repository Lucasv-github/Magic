$scoreboard players set Explosion_size reg_1 $(size)

scoreboard players operation Temp reg_1 = Explosion_size reg_1
function magic:math/cube_root
execute store result storage magic:explosion_radius size int 1 run scoreboard players get Temp reg_1

function magic:base_weaves/weave_explosion_iteration with storage magic:explosion_radius

data remove storage magic:explosion_radius size

tag @s add weave_damaged