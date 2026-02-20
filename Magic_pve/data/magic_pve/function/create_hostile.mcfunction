function magic:magic_support/add_ability

execute store result score @s magic_pve_my_tick run random value 0..20

#To open with some power
scoreboard players set @s sneak_time 0

#To hold the weaves
execute at @s run summon minecraft:chest_minecart ~ ~ ~ {Tags:["magic_pve_inventory"],Invulnerable:1b}
execute at @s run ride @n[type=minecraft:chest_minecart,tag=magic_pve_inventory] mount @s