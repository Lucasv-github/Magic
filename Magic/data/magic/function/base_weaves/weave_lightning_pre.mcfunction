#Make damage 2+size*2
$scoreboard players set Temp reg_1 $(size)

scoreboard players operation Temp reg_2 = Temp reg_1
scoreboard players operation Temp reg_2 *= 2 reg_1
scoreboard players operation Temp reg_2 += 2 reg_1

execute store result storage magic:lightning amount int 1 run scoreboard players get Temp reg_2

scoreboard players operation Temp reg_1 = Temp reg_2
function magic:math/square_root

execute store result storage magic:lightning radius int 1 run scoreboard players get Temp reg_1

function magic:base_weaves/weave_lightning_mid with storage magic:lightning
summon lightning_bolt
tag @s add weave_damaged