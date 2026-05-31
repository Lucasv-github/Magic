tag @s add weave_damaged

$scoreboard players set Temp reg_1 $(size)

#Nerfing explosions

execute at @s if score Temp reg_1 matches 1 run summon minecraft:creeper ~ ~ ~ {Fuse:0b,ExplosionRadius:1}
execute at @s if score Temp reg_1 matches 2 run summon minecraft:creeper ~ ~ ~ {Fuse:0b,ExplosionRadius:2}
execute at @s if score Temp reg_1 matches 3..4 run summon minecraft:creeper ~ ~ ~ {Fuse:0b,ExplosionRadius:3}

execute if score Temp reg_1 matches ..4 run return 0

scoreboard players operation Temp reg_1 /= 5 reg_1

function magic:math/cube_root
execute store result storage magic:explosion_radius size int 1 run scoreboard players get Temp reg_1

$scoreboard players set Temp reg_1 $(size)
scoreboard players operation Temp reg_1 /= 5 reg_1
function magic:base_weaves/weave_explosion_iteration with storage magic:explosion_radius

data remove storage magic:explosion_radius size