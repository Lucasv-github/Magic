#$execute at @s run particle minecraft:glow ~ ~5 ~ 1 1 1 1 $(count) normal @a[tag=can_see]

#Distance 0.1.. is to prevent self
$execute at @s run particle minecraft:glow ~ ~5 ~ 1 1 1 1 $(count) normal @a[tag=can_see,distance=0.1..]