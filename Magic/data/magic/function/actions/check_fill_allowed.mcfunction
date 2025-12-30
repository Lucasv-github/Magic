$say Check fill allowed X: $(x) Z: $(z)
$summon minecraft:armor_stand $(x) 100 $(z) {NoGravity:1b,Tags:["fill_allowed_checker"]}

scoreboard players operation Temp reg_1 = @s entity_id

$execute positioned $(x) 100 $(z) as @e[type=minecraft:armor_stand,tag=fill_allowed_checker,distance=..1] unless score @s safe_fill_creator_entity_id matches -2147483647.. run scoreboard players operation @s safe_fill_creator_entity_id = Temp reg_1


$summon minecraft:tnt $(x) 100 $(z) {fuse:0}