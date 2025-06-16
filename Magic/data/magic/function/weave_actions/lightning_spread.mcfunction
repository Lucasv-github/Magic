summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,Tags:["lightning_location_temp"]}

scoreboard players set Temp reg_1 0
$execute as @e[type=minecraft:armor_stand,limit=1,sort=nearest,distance=..$(radius),tag=weave_lightning_shield,tag=actively_held] run tag @s add lightning_spread_temp
$execute as @e[type=minecraft:armor_stand,limit=1,sort=nearest,distance=..$(radius),tag=weave_lightning_shield,tag=tied_off, scores={weave_remaining_time=1..}] run tag @s add lightning_spread_temp

execute as @e[limit=1,sort=nearest,tag=lightning_spread_temp] run scoreboard players operation Temp reg_1 = @s weave_lightning_shield_count

$execute if score Temp reg_1 matches $(size).. run spreadplayers ~ ~ 0 $(radius) under $(y) false @e[type=minecraft:armor_stand,tag=lightning_location_temp]

#I think the context should be right as this is run as the opponents lightning bolt
$execute unless score Temp reg_1 matches $(size).. at @e[limit=1,sort=nearest,tag=lightning_spread_temp] run function magic:weave_actions/cut_weave

tag @e remove lightning_spread_temp