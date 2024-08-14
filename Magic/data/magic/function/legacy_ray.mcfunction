#Pretty much only option when trowing/bridge
summon snowball ^ ^ ^1 {Tags:["hit_ray"],life:1200,Silent:1b,Health:1f,Passengers:[{id:snowball,Tags:["ray"]}]}
data modify storage magic:legacy_ray Motion set value [0.0,0.0,0.0]

#Hit will survive
scoreboard players operation @e[tag=ray,limit=1, type=snowball, sort=nearest] player_id = @a[limit=1, tag=using, sort=nearest] player_id
scoreboard players operation @e[tag=ray,limit=1, type=snowball, sort=nearest] player_weave_index = @a[limit=1, tag=using, sort=nearest] player_weave_index
scoreboard players operation @e[tag=ray,limit=1, type=snowball, sort=nearest] weave_execute_random_number = #random_id player_id

#Specific weaves that execute along the snowball(0)
execute as @e[tag=ray,limit=1] if score @a[limit=1, tag=using, sort=nearest] player_id = @a[limit=1, tag=using, sort=nearest, scores={t_1=1,t_2=1,t_3=1,t_4=3,t_5=1,t_6=0}] player_id run tag @e[tag=ray,limit=1] add build_bridge
execute as @e[tag=ray,limit=1,tag=!throw_active] if score @a[limit=1, tag=using, sort=nearest] player_id = @a[limit=1, tag=using, sort=nearest, scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=1,t_6=0}] player_id run tag @e[tag=ray,limit=1,tag=!throw_active] add begin_throw

execute store result score @s reg_1 run data get entity @s Pos[0] 1000
execute as @e[tag=hit_ray,limit=1,sort=nearest] store result score @s reg_1 run data get entity @s Pos[0] 1000
scoreboard players operation @e[tag=hit_ray,limit=1,sort=nearest] reg_1 -= @s reg_1
execute store result storage magic:legacy_ray Motion[0] double 0.002 run scoreboard players get @e[tag=hit_ray,limit=1,sort=nearest] reg_1

execute store result score @s reg_1 run data get entity @s Pos[1] 1000
execute as @e[tag=hit_ray,limit=1,sort=nearest] store result score @s reg_1 run data get entity @s Pos[1] 1000
scoreboard players operation @e[tag=hit_ray,limit=1,sort=nearest] reg_1 -= @s reg_1
execute store result storage magic:legacy_ray Motion[1] double 0.002 run scoreboard players get @e[tag=hit_ray,limit=1,sort=nearest] reg_1

execute store result score @s reg_1 run data get entity @s Pos[2] 1000
execute as @e[tag=hit_ray,limit=1,sort=nearest] store result score @s reg_1 run data get entity @s Pos[2] 1000
scoreboard players operation @e[tag=hit_ray,limit=1,sort=nearest] reg_1 -= @s reg_1
execute store result storage magic:legacy_ray Motion[2] double 0.002 run scoreboard players get @e[tag=hit_ray,limit=1,sort=nearest] reg_1

execute anchored eyes run tp @e[tag=hit_ray,limit=1,sort=nearest] ^ ^ ^2
data modify entity @e[tag=hit_ray,limit=1,sort=nearest] Motion set from storage magic:legacy_ray Motion