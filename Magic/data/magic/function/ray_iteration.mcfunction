#Prevent endless loop
execute if entity @s[distance=200..] run scoreboard players set Ray_data reg_2 0

execute if score Ray_data reg_2 matches 1 as @e[distance=..2,type=!item,limit=1,tag=!ray_done,tag=!hit_ray,tag=!ray,tag=!target_point,tag=!bridge] unless score @s player_id = Ray_data reg_1 run scoreboard players set Ray_data reg_2 0

#But do stop at tied off or active weaves
execute if score Ray_data reg_2 matches 1 as @e[distance=..2,tag=actively_held] unless score @s player_id = Ray_data reg_1 run scoreboard players set Ray_data reg_2 0
execute if score Ray_data reg_2 matches 1 as @e[distance=..2,tag=tied_off,scores={weave_remaining_time=1..}] unless score @s player_id = Ray_data reg_1 run scoreboard players set Ray_data reg_2 0

execute unless block ~ ~ ~ minecraft:air run scoreboard players set Ray_data reg_2 0

execute if score Ray_data reg_2 matches 0 run function magic:magic_actions/landed

execute if score Ray_data reg_2 matches 1 positioned ^ ^ ^0.5 run function magic:ray_iteration