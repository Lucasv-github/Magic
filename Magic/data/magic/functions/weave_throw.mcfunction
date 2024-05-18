scoreboard players operation Temp reg_1 = @s player_id
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run tag @s add thrower

execute at @a[tag=thrower] run tag @e[tag=!thrower,limit=1,distance=..10,type=!armor_stand,type=!snowball,sort=nearest] add getting_thrown

#execute at @a[tag=thrower] as @e[tag=!thrower,limit=1,distance=..10,type=!armor_stand,type=!snowball,sort=nearest] run ride @s mount @e[limit=1,sort=nearest,type=minecraft:snowball,tag=ray]

#Remove throw weave+consume 5 without ever landing
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s player_weave_index_current
execute store result storage remove_weave_index index int 1 run scoreboard players get Temp reg_2
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players remove @s current_held 5
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run function magic:player_remove_weave with storage minecraft:remove_weave_index

tag @a remove thrower

tag @s remove begin_throw
tag @s add throw_active