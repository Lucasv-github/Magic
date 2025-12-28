$say Check fill allowed X: $(x) Z: $(z)
$summon minecraft:armor_stand $(x) 100 $(z) {NoGravity:1b,Tags:["fill_allowed_checker"]}

scoreboard players operation @n[type=minecraft:armor_stand,tag=fill_allowed_checker] safe_fill_creator_entity_id = @s entity_id

$summon minecraft:tnt $(x) 100 $(z) {fuse:0}