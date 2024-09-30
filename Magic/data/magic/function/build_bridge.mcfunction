execute unless entity @e[distance=..1,tag=bridge,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Tags:["bridge"],NoGravity:1b,Marker:1b,Invisible:1b}
scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=bridge] player_weave_index = Temp reg_3

#Want to know the size when removing
$scoreboard players set @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=bridge] weave_air_count $(size)

$fill ~$(size) ~ ~$(size) ~-$(size) ~ ~-$(size) minecraft:glass replace minecraft:air

scoreboard players remove Temp reg_1 1
$execute if score Temp reg_1 matches 1.. if entity @s[distance=1..] facing entity @s eyes positioned ^ ^ ^$(size) run function magic:build_bridge with storage magic:weave_size