################################################################################
#Purpose: Preparing to check if fill is allowed at a specific position denoted by $(x) $(z) by summoning an armorstand and then a TNT high in the sky
#Runner: The armorstand responsible for doing the safe filling, via fill_if_allowed.mcfunction, then via fill_if_allowed_iteration.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#$say Check fill allowed X: $(x) Z: $(z)
$summon minecraft:armor_stand $(x) 10000 $(z) {NoGravity:1b,Tags:["fill_allowed_checker"]}

scoreboard players operation Temp reg_1 = @s entity_id

$execute positioned $(x) 10000 $(z) as @e[type=minecraft:armor_stand,tag=fill_allowed_checker,distance=..1] unless score @s safe_fill_creator_entity_id matches -2147483647.. run scoreboard players operation @s safe_fill_creator_entity_id = Temp reg_1


$summon minecraft:tnt $(x) 10000 $(z) {fuse:0}