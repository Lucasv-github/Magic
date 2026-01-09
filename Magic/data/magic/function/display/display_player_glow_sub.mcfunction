################################################################################
#Purpose: Display using-glow with a glow $(count) above an entity
#Runner: Any player whose glow should be displayed, via display/display_player_glow.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#$execute at @s run particle minecraft:glow ~ ~5 ~ 1 1 1 1 $(count) normal @a[tag=can_see]

#Distance 0.1.. is to prevent self
$execute at @s run particle minecraft:glow ~ ~5 ~ 1 1 1 1 $(count) normal @a[tag=can_see,distance=0.1..]