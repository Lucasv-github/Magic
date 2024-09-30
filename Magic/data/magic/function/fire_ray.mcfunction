$fill ~$(size) ~$(size) ~$(size) ~-$(size) ~-$(size) ~-$(size) minecraft:fire replace minecraft:air

$execute as @e[distance=..$(size)] run damage @s $(size) minecraft:on_fire

scoreboard players remove Temp reg_1 1
$execute if score Temp reg_1 matches 1.. if entity @s[distance=$(size)..] facing entity @s eyes positioned ^ ^ ^$(size) run function magic:fire_ray with storage magic:weave_size