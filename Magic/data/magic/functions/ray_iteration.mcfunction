#TODO this function could be made a lot cleaner

execute as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] run particle minecraft:snowflake ~ ~2 ~ 0 0 0 0 10 normal @a
execute if score Ray_data reg_3 matches 0 as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] if entity @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:8,T_1:1,T_2:1,T_3:2,T_4:2,T_5:3,T_6:3,T_7:4,T_8:4,T_9:5,T_10:5,T_11:5,T_12:5,T_13:4,T_14:4,T_15:3,T_16:3,T_17:2,T_18:2,T_19:1,T_20:1}}}]}] run scoreboard players set Ray_data reg_3 1
execute if score Ray_data reg_3 matches 0 unless entity @s[distance=..5] as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] as @e[distance=..2] if score magic_settings magic_balefire_ban matches 1 run function magic:kick
execute if score Ray_data reg_3 matches 0 unless entity @s[distance=..5] as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] as @e[distance=..2] if score magic_settings magic_balefire_ban matches 2 run function magic:ban
execute if score Ray_data reg_3 matches 0 unless entity @s[distance=..5] as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] as @e[distance=..2] run tp @s ~ ~-200 ~

execute if score Ray_data reg_3 matches 0 as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] store result score Temp reg_1 run fill ~ ~ ~ ~ ~ ~ minecraft:air replace #magic:balefire_destroyable

execute if score Ray_data reg_3 matches 1 as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] store result score Temp reg_1 run fill ~ ~ ~ ~ ~ ~ minecraft:amethyst_block replace #magic:balefire_destroyable
execute if score Ray_data reg_3 matches 1 as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] store result score Temp reg_1 run fill ~ ~ ~ ~ ~ ~ minecraft:amethyst_block replace minecraft:air
execute as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] run scoreboard players operation Ray_data reg_4 -= Temp reg_1
execute as @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] if score Ray_data reg_4 matches ..8 run scoreboard players set Ray_data reg_2 0

execute as @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] run particle minecraft:dust{color:[1.0,0.3373, 0.3373], scale:1.0} ~ ~2 ~ 0 0 0 0 10 normal
execute as @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] store result score Temp reg_1 run fill ~ ~ ~ ~ ~ ~ minecraft:air replace #magic:balefire_destroyable
execute unless entity @s[distance=..5] as @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] as @e[distance=..2] run damage @s 10 minecraft:in_fire
execute unless entity @s[distance=..5] as @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] unless entity @e[type=minecraft:fireball,distance=..2] run summon minecraft:fireball ~ ~1 ~ {ExplosionPower:2,Motion:[0.0,-10.0,0.0]}
execute as @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] run scoreboard players operation Ray_data reg_4 -= Temp reg_1
execute as @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] if score Ray_data reg_4 matches ..8 run scoreboard players set Ray_data reg_2 0

execute as @s[scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=3,t_6=0}] run particle minecraft:flame ~ ~2 ~ 0 0 0 0 10 normal @a
execute as @s[scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=3,t_6=0}] as @e[distance=..2] unless score @s player_id = Ray_data reg_1 at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:fire replace minecraft:air
execute as @s[scores={t_1=3,t_2=3,t_3=3,t_4=3,t_5=3,t_6=0}] as @e[distance=..2] unless score @s player_id = Ray_data reg_1 at @s as @e[distance=..4] run damage @s 10 minecraft:in_fire

execute as @a[distance=..5,scores={projectile_shielded=1..}] unless score @s player_id = Ray_data reg_1 run scoreboard players set Ray_data reg_2 0

execute if entity @s[distance=200..] run scoreboard players set Ray_data reg_2 0

#Don't stop at entity if balefire/fire ray
execute unless entity @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] unless entity @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] if score Ray_data reg_2 matches 1 as @e[distance=..2,type=!item,limit=1,tag=!ray_done,tag=!hit_ray,tag=!ray,tag=!target_point,tag=!bridge] unless score @s player_id = Ray_data reg_1 run scoreboard players set Ray_data reg_2 0

#But do stop at tied off or active weaves
execute unless entity @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] unless entity @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] if score Ray_data reg_2 matches 1 as @e[distance=..2,tag=actively_held] unless score @s player_id = Ray_data reg_1 run scoreboard players set Ray_data reg_2 0

execute unless entity @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] unless entity @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] if score Ray_data reg_2 matches 1 as @e[distance=..2,tag=tied_off,scores={weave_remaining_time=1..}] unless score @s player_id = Ray_data reg_1 run scoreboard players set Ray_data reg_2 0

execute if entity @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ #magic:balefire_destroyable run scoreboard players set Ray_data reg_2 0
execute unless entity @s[scores={t_1=3,t_2=3,t_3=1,t_4=3,t_5=3,t_6=1,t_7=3,t_8=3,t_9=0}] unless entity @s[scores={t_1=5,t_2=5,t_3=3,t_4=5,t_5=5,t_6=3,t_7=5,t_8=5,t_9=0}] unless block ~ ~ ~ minecraft:air run scoreboard players set Ray_data reg_2 0

execute if score Ray_data reg_2 matches 0 run function magic:landed

execute if score Ray_data reg_2 matches 1 positioned ^ ^ ^0.5 run function magic:ray_iteration