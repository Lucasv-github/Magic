$execute store result score Temp reg_1 run random value -$(size)..$(size)
$execute store result score Temp reg_2 run random value -$(size)..$(size)
$execute store result score Temp reg_3 run random value -$(size)..$(size)

#summon armor_stand ~ ~ ~ {Passengers:[{id:tnt_minecart,TNTFuse:0,Invulnerable:1}],NoGravity:1b,Tags:["temp_explosion"]}
#summon tnt_minecart ~ ~ ~ {TNTFuse:1,Invulnerable:1,Tags:["temp_explosion"]}
summon minecraft:tnt ~ ~ ~ {fuse:1,NoGravity:1b,Tags:["temp_explosion"]}

execute store result score Temp reg_4 run data get entity @e[tag=temp_explosion,limit=1] Pos[0]
scoreboard players operation Temp reg_1 += Temp reg_4

execute store result score Temp reg_4 run data get entity @e[tag=temp_explosion,limit=1] Pos[1]
scoreboard players operation Temp reg_2 += Temp reg_4

execute store result score Temp reg_4 run data get entity @e[tag=temp_explosion,limit=1] Pos[2]
scoreboard players operation Temp reg_3 += Temp reg_4

execute store result entity @e[tag=temp_explosion,limit=1] Pos[0] double 1 run scoreboard players get Temp reg_1
execute store result entity @e[tag=temp_explosion,limit=1] Pos[1] double 1 run scoreboard players get Temp reg_2
execute store result entity @e[tag=temp_explosion,limit=1] Pos[2] double 1 run scoreboard players get Temp reg_3

tag @e remove temp_explosion

scoreboard players remove Explosion_size reg_1 1
execute if score Explosion_size reg_1 matches 1.. run function magic:base_weaves/weave_explosion_iteration with storage magic:explosion_radius