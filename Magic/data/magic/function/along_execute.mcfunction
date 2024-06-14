#Bridge
execute at @s[tag=build_bridge] run fill ~-4 ~-2 ~-4 ~-2 ~-3 ~-2 minecraft:glass replace minecraft:air
execute at @s[tag=build_bridge] run summon armor_stand ~-2 ~1 ~-2 {Tags:["destroy_bridge","bridge"], NoGravity:1, Invisible:1b}
#Only set bride to 5 as we will add 10 VERY soon. Can't be to low either
execute at @s[tag=build_bridge] as @e[type=armor_stand, tag=destroy_bridge] run scoreboard players set @s bridge 5
execute at @s[tag=build_bridge] run scoreboard players operation @e[sort=nearest, type=minecraft:armor_stand, tag=destroy_bridge, distance=..5] weave_execute_random_number = @e[type=minecraft:snowball,tag=ray, tag=build_bridge] weave_execute_random_number

#Throw
execute at @s[tag=begin_throw] run function magic:weave_throw
