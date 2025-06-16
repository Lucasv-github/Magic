#Make damage 2+size*2
$scoreboard players set Temp reg_1 $(size)

scoreboard players operation Temp reg_2 = Temp reg_1
scoreboard players operation Temp reg_2 *= 2 reg_1
scoreboard players operation Temp reg_2 += 2 reg_1

execute store result storage magic:lightning amount int 1 run scoreboard players get Temp reg_2

scoreboard players operation Temp reg_1 = Temp reg_2
function magic:math/square_root

execute store result storage magic:lightning radius int 1 run scoreboard players get Temp reg_1

scoreboard players operation Temp reg_2 = Temp reg_1
scoreboard players add Temp reg_2 10

$data modify storage magic:lightning_spread size set value $(size)
execute store result storage magic:lightning_spread y int 1 run data get entity @s Pos[1]
execute store result storage magic:lightning_spread radius int 1 run scoreboard players get Temp reg_2

function magic:weave_actions/lightning_spread with storage magic:lightning_spread

execute at @e[type=minecraft:armor_stand,tag=lightning_location_temp] run function magic:base_weaves/weave_lightning_mid with storage magic:lightning
execute at @e[type=minecraft:armor_stand,tag=lightning_location_temp] run summon lightning_bolt

kill @e[type=minecraft:armor_stand,tag=lightning_location_temp]

tag @s add weave_damaged